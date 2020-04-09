package com.xieke.admin.web.pe;

import com.xieke.admin.annotation.SysLog;
import com.xieke.admin.entity.ClubCardPaytype;
import com.xieke.admin.entity.Clubcard;
import com.xieke.admin.entity.Integral;
import com.xieke.admin.entity.pe.ContractPaytype;
import com.xieke.admin.entity.pe.PrivateContract;
import com.xieke.admin.entity.Result;
import com.xieke.admin.service.IntegralService;
import com.xieke.admin.service.pe.ContractPaytypeService;
import com.xieke.admin.service.pe.ContractService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * 私教合同管理
 */
@Controller
@RequestMapping("/pe/contract")
public class ContractController {

    @Autowired
    private ContractService contractService;

    @Autowired
    private ContractPaytypeService contractPaytypeService;

    @Autowired
    private IntegralService integralService;

    @RequestMapping("/list")
    public String list(){
        return "/contract/list";
    }
    @RequestMapping("/add")
    public String add(){
        return "/contract/add";
    }

    @RequestMapping("/edit")
    public String edit(){
        return "/contract/edit";
    }

    /**
     * 获取私教合同列表
     * @param page
     * @param limit
     * @param name
     * @param phone
     * @return
     */
    @RequestMapping("/list/data")
    @ResponseBody
    public Result selectAll(Integer page, Integer limit,String name,String phone){
        Result result = new Result();
        List<PrivateContract> privateContracts = contractService.selectAll(page,limit,name,phone);
        int count = contractService.count(name,phone);
        result.setStatus(200);
        result.setMessage("获取成功!");
        result.setCount(count);
        result.setData(privateContracts);
        return result;
    }

    @RequestMapping("/add/submit")
    @SysLog("添加私教合同信息")
    @RequiresPermissions("contractset:add")
    public @ResponseBody
    Result add(PrivateContract privateContract, @RequestParam("paytypeIds[]")Integer[] paytypeIds, @RequestParam("paytypeMonies[]")Double[] paytypeMonies, String firstmoneyId) {
        return contractService.createClubCard(privateContract,paytypeIds,paytypeMonies,firstmoneyId);
    }

    @RequestMapping("/printview/page")
    @SysLog("打印私教合同信息")
    @RequiresPermissions("contractset:printview")
    public ModelAndView printview(ModelAndView modelAndView, String contractNumber) throws Exception {
        //String s = jiemi.aesDecrypt(clubcardNum);
        modelAndView.setViewName("/contract/index");
         PrivateContract privateContract = contractService.getContractInfo(contractNumber);
        if (privateContract == null){
            modelAndView.addObject("message","数据异常!");
            modelAndView.setViewName("/error/error");
            return modelAndView;
        }
        List<ContractPaytype> contractPaytypes = contractPaytypeService.findByContractId(privateContract.getId());
        Integral integral = integralService.getByClubCardNum(privateContract.getContractNumber());
        modelAndView.addObject("contractIntegral",integral);
        modelAndView.addObject("contractInfo",privateContract);
        modelAndView.addObject("contractPayTypeInfo",contractPaytypes);
        modelAndView.addObject("totalPurchaseAmount",Double.valueOf(privateContract.getTotalPurchaseAmount()));
        modelAndView.addObject("payfor",Double.valueOf(privateContract.getPayfor()));
        return modelAndView;
    }

    @RequestMapping("/examine/page")
    @RequiresPermissions("contractset:examine")
    public ModelAndView examine(ModelAndView modelAndView, String contractNumber) throws Exception {
        //String s = jiemi.aesDecrypt(clubcardNum);
        modelAndView.setViewName("/contract/examine");
        PrivateContract privateContract = contractService.getContractInfo(contractNumber);
        if (privateContract == null){
            modelAndView.addObject("message","数据异常!");
            modelAndView.setViewName("/error/error");
            return modelAndView;
        }
        List<ContractPaytype> contractPaytypes = contractPaytypeService.findByContractId(privateContract.getId());
        Integral integral = integralService.getByClubCardNum(privateContract.getContractNumber());
        modelAndView.addObject("contractIntegral",integral);
        modelAndView.addObject("contractInfo",privateContract);
        modelAndView.addObject("contractPayTypeInfo",contractPaytypes);
        modelAndView.addObject("totalPurchaseAmount",Double.valueOf(privateContract.getTotalPurchaseAmount()));
        modelAndView.addObject("payfor",Double.valueOf(privateContract.getPayfor()));
        return modelAndView;
    }

    /**
     * 审核
     * @param id
     * @return
     */
    @SysLog("审核私教合同")
    @RequestMapping("/examine")
    public @ResponseBody
    Result examine(String id) {
        Integer row = contractService.examine(id);
        Result result = new Result();
        result.setStatus(200);
        result.setMessage("审核成功@!");
        result.setCount(row);
        result.setData(row);
        return result;
    }


}
