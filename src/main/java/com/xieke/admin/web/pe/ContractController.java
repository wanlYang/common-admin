package com.xieke.admin.web.pe;

import com.xieke.admin.annotation.SysLog;
import com.xieke.admin.entity.Clubcard;
import com.xieke.admin.entity.pe.PrivateContract;
import com.xieke.admin.entity.Result;
import com.xieke.admin.service.pe.ContractService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * 私教合同管理
 */
@Controller
@RequestMapping("/pe/contract")
public class ContractController {

    @Autowired
    private ContractService contractService;

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


}
