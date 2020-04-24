package com.xieke.admin.config;

import com.xieke.admin.entity.pe.Order;
import com.xieke.admin.service.CustomerService;
import com.xieke.admin.service.pe.ContractService;
import com.xieke.admin.service.pe.OfficeService;
import com.xieke.admin.service.pe.OrderService;
import com.xieke.admin.service.pe.ShoppingService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.redis.connection.Message;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.listener.KeyExpirationEventMessageListener;
import org.springframework.data.redis.listener.RedisMessageListenerContainer;
import org.springframework.stereotype.Component;

import java.util.concurrent.TimeUnit;

@Component
public class RedisKeyExpirationListener extends KeyExpirationEventMessageListener {
    private Logger logger = Logger.getLogger(getClass());

    @Autowired
    private CustomerService customerService;
    @Autowired
    private ContractService contractService;
    @Autowired
    private OfficeService officeService;
    @Autowired
    private ShoppingService shoppingService;
    @Autowired
    private OrderService orderService;

    @Value("${coach.deduction.times}")
    private Integer deductionTimes;

    @Autowired
    private StringRedisTemplate redisTemplate;

    public RedisKeyExpirationListener(RedisMessageListenerContainer listenerContainer) {
        super(listenerContainer);
    }

    @Override
    public void onMessage(Message message, byte[] pattern) {
        // 注意：我们只能获取到失效的 key 而获取不到 value，
        // 所以在设计 key 的时候可以考虑把 value 一并放到 key，然后根据规则取出 value
        String key = new String(message.getBody());
        logger.info("key:{}" + key);
        // message.toString()也可以获取失效的key
        String expiredKey = message.toString();
        logger.info("expiredKey:" + expiredKey );
        //如果是 order- 开头的key，将订单状态设置为 已取消
        if(expiredKey.startsWith("order-")){
            //orderService.updateOrderStatus();
            Order order = orderService.findByOrderKey(key);
            if (order != null){
                if (order.getStatus() == 0){
                    //设置状态为上课中 预约状态0 未完成  1已完成 2系统上课中  3缺席 5取消
                    orderService.updateOrderStatus(key,2);
                    redisTemplate.opsForValue().set(key,
                            key, 3600, TimeUnit.SECONDS);
                }
                if (order.getStatus() == 2){
                    //设置状态为上课中 预约状态0 未完成  1已完成 2系统上课中  3缺席 5取消
                    orderService.updateOrderStatus(key,1);
                    //课程正常完成是进行扣次
                    contractService.deductionTimes(order.getContract().getId(),deductionTimes);
                }
            }

        }
    }

}
