package com.xieke.admin.service.impl;

import com.xieke.admin.entity.Fromsource;
import com.xieke.admin.mapper.FromsourceMapper;
import com.xieke.admin.service.FromsourceService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
@Service
public class FromsourceServiceImpl implements FromsourceService {

    @Resource
    private FromsourceMapper fromsourceMapper;

    @Override
    public List<Fromsource> selectAllFromsource() {
        return fromsourceMapper.selectAllFromsource();
    }

    @Override
    public int insertFromsource(Fromsource fromsource) {
        return fromsourceMapper.insertFromsource(fromsource);
    }

    @Override
    public int updateFromsorce(Fromsource fromsource) {
        return fromsourceMapper.updateFromsorce(fromsource);
    }

    @Override
    public int deleteFromsorce(Fromsource fromsource) {
        return fromsourceMapper.deleteFromsorce(fromsource);
    }



    public static List<Fromsource> listToTree(List<Fromsource> list) {
        //用递归找子。
        List<Fromsource> treeList = new ArrayList<Fromsource>();
        for (Fromsource tree : list) {
            if (tree.getParentId() == 0) {
                treeList.add(findChildren(tree, list));
            }
        }
        return treeList;
    }

    private static Fromsource findChildren(Fromsource tree, List<Fromsource> list) {
        for (Fromsource node : list) {
            if (node.getParentId() == tree.getId()) {
                if (tree.getChildren() == null) {
                    tree.setChildren(new ArrayList<Fromsource>());
                }
                tree.getChildren().add(findChildren(node, list));
            }
        }
        return tree;
    }

    @Override
    public List<Fromsource> getFromSourceTree() {
        List<Fromsource> fromsources = fromsourceMapper.selectAllFromsource();
        List<Fromsource> fromsources_ = listToTree(fromsources);

        return fromsources_;
    }
}
