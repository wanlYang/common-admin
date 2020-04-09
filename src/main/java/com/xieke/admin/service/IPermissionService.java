package com.xieke.admin.service;

import com.baomidou.mybatisplus.service.IService;
import com.xieke.admin.dto.MenuInfo;
import com.xieke.admin.dto.PermissionInfo;
import com.xieke.admin.entity.Permission;

import java.util.List;

/**
 * <p>
 * 系统权限表 服务类
 * </p>
 *
 * @author Auto Generator
 * @since 2018-07-16
 */
public interface IPermissionService extends IService<Permission> {

    Permission getParentPermissionByCode(String pessCode);
    List<MenuInfo> getPermissionMenuInfoByCode(String pessCode);
    Permission getPermissionByCode(String pessCode);


    List<Permission> getAllPermissions();

     Boolean savePermission(Permission permission);

     Boolean delBatchPermission(List<Integer> ids);

     List<PermissionInfo> allPermissionInfo();

     List<MenuInfo> getMenuPermissions(String code);

     List<Permission> getTopDirectoryPermissions();

     Boolean delPermission(Integer id);

    List<MenuInfo> getButtononPermissions(String code);

    List<MenuInfo> getStroePermissions(String code);

    List<MenuInfo> getImagesPermissions(String code);

    Integer updateByCode(Permission permission_);
}