package com.xieke.admin.web.timetable;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.xieke.admin.constant.TopShowConstant;
import com.xieke.admin.dto.MenuInfo;
import com.xieke.admin.dto.ResultInfo;
import com.xieke.admin.dto.RoleInfo;
import com.xieke.admin.dto.UserInfo;
import com.xieke.admin.entity.Result;
import com.xieke.admin.entity.timetable.StoreFront;
import com.xieke.admin.entity.timetable.TableCources;
import com.xieke.admin.entity.timetable.TableImages;
import com.xieke.admin.entity.timetable.Week;
import com.xieke.admin.service.IPermissionService;
import com.xieke.admin.service.timetable.TableCourcesService;
import com.xieke.admin.util.UploadUtils;
import com.xieke.admin.web.BaseController;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Controller
@CrossOrigin
@RequestMapping("/admin/cources/table")

public class TableCourcesController  extends BaseController {

	@Autowired
	private TableCourcesService tableCourcesService;

    @Resource
    private IPermissionService iPermissionService;


    @RequestMapping(value = "/week/list", method = RequestMethod.POST)
    @ResponseBody
    public Result getWeek() {
        Result result = new Result();
        List<Week> weeks = tableCourcesService.getWeek();
        result.setStatus(200);
        result.setMessage("获取成功@!");
        result.setData(weeks);
        return result;
    }

	@RequestMapping(value = "/init", method = RequestMethod.GET)
	@ResponseBody
	public Result init(String StoreId) {
		Result result = new Result();
		boolean flag = tableCourcesService.init(StoreId);
		result.setStatus(200);
		result.setMessage("获取成功@!");
		result.setData(flag);
		return result;
	}

	/**
	 * 获取店面信息
	 * @return
	 */
	@RequestMapping(value = "/week/list/front", method = RequestMethod.POST)
    @ResponseBody
    public Result getWeekFront(String code) {
        List<MenuInfo> menuInfoList = new ArrayList<>();
        Result result = new Result();
        List<StoreFront> storeFronts_ = new ArrayList<>();
        //获取当前用户角色信息
        UserInfo userInfo = this.getUserInfo();
        RoleInfo roleInfo = userInfo.getRoleInfo();
        List<MenuInfo>  allMenuInfoList = iPermissionService.getButtononPermissions(code);
        //获得有权限访问菜单
        for (MenuInfo info : allMenuInfoList) {
            if(roleInfo.getPermissionIds().contains(","+info.getOnlyId()+",") && isNumeric(info.getCode())){
                if (info.getChildren() != null){
                    List<MenuInfo> subMenuInfoList = new ArrayList<>();
                    for (MenuInfo subInfo : info.getChildren()) {
                        if (roleInfo.getPermissionIds().contains(","+subInfo.getOnlyId()+",")){
                            subMenuInfoList.add(subInfo);
                        }
                    }
                    info.setChildren(subMenuInfoList);
                }
                StoreFront storeFront = new StoreFront();
                storeFront.setId(info.getCode());
                storeFront.setName(info.getTitle());
                storeFronts_.add(storeFront);
                menuInfoList.add(info);
            }
        }
        result.setStatus(200);
        result.setMessage("获取成功@!");
        result.setData(storeFronts_);
        return result;
    }
    public static boolean isNumeric(String str) {
        // 该正则表达式可以匹配所有的数字 包括负数
        Pattern pattern = Pattern.compile("-?[0-9]+(\\.[0-9]+)?");
        String bigStr;
        try {
            bigStr = new BigDecimal(str).toString();
        } catch (Exception e) {
            return false;//异常 说明包含非数字。
        }

        Matcher isNum = pattern.matcher(bigStr); // matcher是全匹配
        if (!isNum.matches()) {
            return false;
        }
        return true;
    }

	/**
	 * 前端接口/获取每星期第一条数据，一次类推
	 * @param
	 * @return
	 */
	@RequestMapping(value = "/list/front/end/sideways", method = RequestMethod.GET,produces = {"application/json;charset=UTF-8"})
	@ResponseBody
	public String getCourcesFront(String id, HttpServletResponse response,
								  @RequestParam(value = "callback",required = false) final String callback) {
		Result result = new Result();
		List<List<TableCources>> lists = tableCourcesService.getAllWeekCources(id);
		result.setStatus(200);
		result.setMessage("获取成功@!");
		result.setData(lists);
		response.addHeader("Access-Control-Allow-Origin", "*");
		response.addHeader("Access-Control-Allow-Method", "*");
		response.setCharacterEncoding("utf-8");
		response.addHeader("Access-Control-Allow-Headers","Content-Type");
		if (StringUtils.isNotBlank(callback)) {
			return callback + "(" + JSON.toJSONString(result, SerializerFeature.DisableCircularReferenceDetect) + ");";
		}
		return JSON.toJSONString(result,SerializerFeature.DisableCircularReferenceDetect);
	}
	@RequestMapping(value = "/list/front/end/sideways/all", method = RequestMethod.GET,produces = {"application/json;charset=UTF-8"})
	@ResponseBody
	public String getCourcesFrontAll(HttpServletResponse response,
                                     @RequestParam(value = "callback",required = false) final String callback) {
		Result result = new Result();
		List<StoreFront> lists = tableCourcesService.getAllWeekCourcesDay();
		result.setStatus(200);
		result.setMessage("获取成功@!");
		result.setData(lists);
		response.addHeader("Access-Control-Allow-Origin", "*");
		response.addHeader("Access-Control-Allow-Method", "*");
		response.setCharacterEncoding("utf-8");
		response.addHeader("Access-Control-Allow-Headers","Content-Type");
		if (StringUtils.isNotBlank(callback)) {
			return callback + "(" + JSON.toJSONString(result, SerializerFeature.DisableCircularReferenceDetect) + ");";
		}
		return JSON.toJSONString(result,SerializerFeature.DisableCircularReferenceDetect);
	}
	/**
	 * 前端接口/获取每星期一天数据
	 * @return
	 */
	@RequestMapping(value = "/list/front/end", method = RequestMethod.GET,produces = {"application/json;charset=UTF-8"})
	@ResponseBody
	public String getCourcesFront_week(HttpServletResponse response,
                                       @RequestParam(value = "callback",required = false) final String callback) {
		Result result = new Result();
		List<StoreFront> lists = tableCourcesService.getAllWeekCourcesDay();
		result.setStatus(200);
		result.setMessage("获取成功@!");
		result.setData(lists);
		response.addHeader("Access-Control-Allow-Origin", "*");
		response.addHeader("Access-Control-Allow-Method", "*");
		response.addHeader("Access-Control-Allow-Headers","Content-Type");
		if (StringUtils.isNotBlank(callback)) {
			return callback + "(" + JSON.toJSONString(result,SerializerFeature.DisableCircularReferenceDetect) + ");";
		}
		return JSON.toJSONString(result,SerializerFeature.DisableCircularReferenceDetect);
	}
	
	/**
	 * 添加课程页面
	 * @return
	 */
	@RequestMapping(value = "/add/page", method = RequestMethod.GET)
	public ModelAndView add(ModelAndView modelAndView) {
		modelAndView.setViewName("/timetable/add_table_cources");
		return modelAndView;
	}
	
	/**
	 * 编辑
	 * @param modelAndView
	 * @return
	 */
	@RequestMapping(value = "/edit/page", method = RequestMethod.GET)
    public ModelAndView edit(ModelAndView modelAndView) {
        modelAndView.setViewName("/timetable/edit_table_cources");
        return modelAndView;
    }
	
	/**
	 * 课程表页面
	 * @param modelAndView
	 * @return
	 */
	@RequestMapping(value = "/list",method = RequestMethod.GET)
    public ModelAndView courcesList(ModelAndView modelAndView,String code) {
        modelAndView.addObject("code",code);
    	modelAndView.setViewName("/timetable/table_cources_list");
        return modelAndView;
    }
	
	/**
	 * 获取星期一课程表根据门店
	 * @return
	 */
	@RequestMapping(value = "/list/monday",method = RequestMethod.POST)
	@ResponseBody
    public Result monday(String front,String week) {
		return getCources(front, week);
    }
	
	/**
	 * 获取星期二课程表根据门店
	 * @return
	 */
	@RequestMapping(value = "/list/tuesday",method = RequestMethod.POST)
	@ResponseBody
    public Result tuesday(String front,String week) {
        return getCources(front, week);
    }
	
	/**
	 * 获取星期三课程表根据门店
	 * @return
	 */
	@RequestMapping(value = "/list/wednesday",method = RequestMethod.POST)
	@ResponseBody
    public Result wednesday(String front,String week) {
        return getCources(front, week);
    }
	/**
	 * 获取星期四课程表根据门店
	 * @return
	 */
	@RequestMapping(value = "/list/thursday",method = RequestMethod.POST)
	@ResponseBody
    public Result thursday(String front,String week) {
        return getCources(front, week);
    }
	/**
	 * 获取星期五课程表根据门店
	 * @return
	 */
	@RequestMapping(value = "/list/friday",method = RequestMethod.POST)
	@ResponseBody
    public Result friday(String front,String week) {
        return getCources(front, week);
    }
	/**
	 * 获取星期六课程表根据门店
	 * @return
	 */
	@RequestMapping(value = "/list/saturday",method = RequestMethod.POST)
	@ResponseBody
    public Result saturday(String front,String week) {
        return getCources(front, week);
    }
	/**
	 * 获取星期天课程表根据门店
	 * @return
	 */
	@RequestMapping(value = "/list/sunday",method = RequestMethod.POST)
	@ResponseBody
    public Result sunday(String front,String week) {
        return getCources(front, week);
    }
	
	public Result getCources(String front,String week) {
		Result result = new Result();
        List<TableCources> cources = tableCourcesService.getAllWeekCources(front,week);   
        if (cources != null) {
            result.setMessage("获取成功!");
            result.setData(cources);
            result.setStatus(200);
            return result;
        }
        result.setMessage("获取失败!");
        result.setData(null);
        result.setStatus(-1);
        return result;
	}
	
	/**
     * 添加课程页面
     * @return
     */
    @RequestMapping(value = "/add/submit", method = RequestMethod.POST)
    @ResponseBody
    public Result addSubmit(TableCources tableCources) {
        Result result = tableCourcesService.addCources(tableCources);
        return result;
    }
	
    @RequestMapping(value = "/edit/submit", method = RequestMethod.POST)
    @ResponseBody
    public Result editSubmit(TableCources tableCources) {
        Result result = tableCourcesService.editCources(tableCources);
        return result;
    }
    
    @RequestMapping(value = "/delete/submit", method = RequestMethod.POST)
    @ResponseBody
    public Result delete(String id) {
        Result result = tableCourcesService.delete(id);
        return result;
    }

	@RequestMapping(value = "/storefront/list/table", method = RequestMethod.POST)
	@ResponseBody
	public Result store(String code) {
        List<MenuInfo> menuInfoList_ = new ArrayList<>();
        Result result = new Result();
        List<StoreFront> storeFronts_ = new ArrayList<>();
        //获取当前用户角色信息
        UserInfo userInfo = this.getUserInfo();
        RoleInfo roleInfo = userInfo.getRoleInfo();
        List<MenuInfo>  allMenuInfoList = iPermissionService.getStroePermissions(code);
        //获得有权限访问菜单
        for (MenuInfo info : allMenuInfoList) {
            if(roleInfo.getPermissionIds().contains(","+info.getOnlyId()+",") && isNumeric(info.getCode())){
                if (info.getChildren() != null){
                    List<MenuInfo> subMenuInfoList = new ArrayList<>();
                    for (MenuInfo subInfo : info.getChildren()) {
                        if (roleInfo.getPermissionIds().contains(","+subInfo.getOnlyId()+",")){
                            subMenuInfoList.add(subInfo);
                        }
                    }
                    info.setChildren(subMenuInfoList);
                }
                StoreFront storeFront = new StoreFront();
                storeFront.setId(info.getCode());
                storeFront.setName(info.getTitle());
                storeFronts_.add(storeFront);
                menuInfoList_.add(info);
            }
        }
        result.setStatus(200);
        result.setMessage("获取成功@!");
        result.setData(storeFronts_);
        return result;
	}

	@RequestMapping(value = "/storefront/list", method = RequestMethod.GET)
	public ModelAndView storePage(ModelAndView modelAndView,String code) {
        modelAndView.addObject("code",code);
		modelAndView.setViewName("/timetable/store_list");
		return modelAndView;
	}

	/**
	 * 店面添加页面
	 * @param modelAndView
	 * @return
	 */
	@RequestMapping(value = "/store/add", method = RequestMethod.GET)
	public ModelAndView storeAdd(ModelAndView modelAndView, HttpSession session) {
		modelAndView.setViewName("/timetable/add_store");
		return modelAndView;
	}
	@RequestMapping(value = "/store/edit", method = RequestMethod.GET)
	public ModelAndView storeEdit(ModelAndView modelAndView, HttpSession session) {
		modelAndView.setViewName("/timetable/edit_store");
		return modelAndView;
	}

	/**
	 * 添加店面提交
	 * @param storeFront
	 * @return
	 */
	@RequestMapping(value = "/store/add/submit", method = RequestMethod.POST)
	@ResponseBody
	public Result addStoreSubmit(StoreFront storeFront,String pessCode) {
		return tableCourcesService.addStore(storeFront,pessCode);
	}

	@RequestMapping(value = "/store/edit/submit", method = RequestMethod.POST)
	@ResponseBody
	public Result editStoreSubmit(StoreFront storeFront,String pessCode) {

		return tableCourcesService.editStore(storeFront,pessCode);
	}


	@RequestMapping(value = "/admin/list/get/front", method = RequestMethod.POST)
	@ResponseBody
	public Result getAdminFront(String admin_id) {
		Result result = new Result();
		StoreFront storeFronts = tableCourcesService.getOneFront(admin_id);
		result.setStatus(200);
		result.setMessage("获取成功@!");
		result.setData(storeFronts);
		return result;
	}


	/**
	 * 上传课程表图片
	 * @param modelAndView
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/images/list", method = RequestMethod.GET)
	public ModelAndView imagesList(ModelAndView modelAndView, HttpSession session,String code) {
	    modelAndView.addObject("code",code);
		modelAndView.setViewName("/timetable/images_list");
		return modelAndView;
	}

	@RequestMapping(value = "/images/list/submit", method = RequestMethod.POST)
    @ResponseBody
    public Result imagesListSubmit(ModelAndView modelAndView, HttpSession session, String code) {
        List<TableImages> tableImagesList = new ArrayList<>();
        List<MenuInfo> menuInfoList_ = new ArrayList<>();
        Result result = new Result();
        List<StoreFront> storeFronts_ = new ArrayList<>();
        //获取当前用户角色信息
        UserInfo userInfo = this.getUserInfo();
        RoleInfo roleInfo = userInfo.getRoleInfo();
        List<MenuInfo>  allMenuInfoList = iPermissionService.getImagesPermissions(code);
        //获得有权限访问菜单
        for (MenuInfo info : allMenuInfoList) {
            if(roleInfo.getPermissionIds().contains(","+info.getOnlyId()+",") && isNumeric(info.getCode())){
                if (info.getChildren() != null){
                    List<MenuInfo> subMenuInfoList = new ArrayList<>();
                    for (MenuInfo subInfo : info.getChildren()) {
                        if (roleInfo.getPermissionIds().contains(","+subInfo.getOnlyId()+",")){
                            subMenuInfoList.add(subInfo);
                        }
                    }
                    info.setChildren(subMenuInfoList);
                }
                StoreFront storeFront = new StoreFront();
                TableImages tableImages = tableCourcesService.getImagesByStoreId(info.getCode());
                tableImagesList.add(tableImages);
                storeFront.setId(info.getCode());
                storeFront.setName(info.getTitle());
                storeFronts_.add(storeFront);
                menuInfoList_.add(info);
            }
        }
        result.setStatus(200);
        result.setMessage("获取成功@!");
        result.setData(tableImagesList);
        return result;
    }

	@RequestMapping(value = "/images/get/front", method = RequestMethod.POST)
	@ResponseBody
	public Result getFront(ModelAndView modelAndView, HttpSession session, String storeid) {

		Result result = new Result();
		StoreFront storeFront = tableCourcesService.findStoreById(storeid);
		result.setStatus(200);
		result.setMessage("获取成功!");
		result.setData(storeFront);
		return result;
	}
    @RequestMapping(value = "/images/add", method = RequestMethod.GET)
	public ModelAndView imagesAdd(ModelAndView modelAndView, HttpSession session) {
		modelAndView.setViewName("/timetable/add_images");
		return modelAndView;
	}
	@RequestMapping(value = "/images/edit", method = RequestMethod.GET)
	public ModelAndView imagesEdit(ModelAndView modelAndView, HttpSession session) {
		modelAndView.setViewName("/timetable/edit_images");
		return modelAndView;
	}
    @RequestMapping(value = "/images/delete/submit", method = RequestMethod.POST)
    @ResponseBody
    public Result deleteSubmit(ModelAndView modelAndView, HttpSession session, String id) {
        Result result = new Result();
        Integer row = tableCourcesService.deleteImages(id);
        result.setStatus(200);
        result.setMessage("删除成功!");
        result.setData(row);
        return result;
    }

	@ResponseBody
	@RequestMapping(value = { "/edit/upload/img" }, method = { RequestMethod.POST })
	public Map<String, Object> editChangeImg(HttpServletRequest request, @RequestParam("file") MultipartFile file, String storename, String storeid, HttpSession session)
			throws IllegalStateException, IOException {
        if (!StringUtils.isNotBlank(storename)){
            Map<String, Object> map_ = new HashMap<String, Object>();
            map_.put("code",-1);
            map_.put("msg","店名为空!");
            return map_;
        }
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSS");
        String rootPath = request.getServletContext().getRealPath("/admin/uploads/");
        String res = sdf.format(new Date());
        String originalFilename = file.getOriginalFilename();
        String newFileName = res + originalFilename.substring(originalFilename.lastIndexOf("."));
        File newFile = new File(rootPath + File.separator + "cources" + File.separator + newFileName);
        if (!newFile.getParentFile().exists()) {
            newFile.getParentFile().mkdirs();
        }
        file.transferTo(newFile);
        String fileUrl = "/admin/uploads/cources/" + newFileName;
        Map<String, Object> map = new HashMap<String, Object>();
        TableImages tableImages = new TableImages();
        tableImages.setSrc(fileUrl);
        StoreFront storeFront = new StoreFront();
        storeFront.setId(storeid);
        tableImages.setStoreFront(storeFront);
        Integer row = tableCourcesService.addCourcesImages(tableImages);
        map.put("code", Integer.valueOf(0));
        map.put("msg", "上传成功!");
        Map<String, Object> mapData = new HashMap<String, Object>();
        mapData.put("src", request.getContextPath() + fileUrl);
        mapData.put("title", newFileName);
        map.put("data", mapData);
        return map;
	}
}
