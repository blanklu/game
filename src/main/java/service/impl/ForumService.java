package service.impl;

import mapper.ForumMapper;
import model.FindListResult;
import model.Forum;
import model.Page;
import org.springframework.stereotype.Service;
import service.IForumService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

@Service
public class ForumService implements IForumService {

    @Autowired
    private ForumMapper forumMapper;

    @Override
    public FindListResult findList(Page page) {
        FindListResult findListResult = new FindListResult();
        findListResult.setCode(0);
        findListResult.setMsg("success");
        try {
            List<Forum> list = forumMapper.selectList(page);
            int cout = forumMapper.selectCount();
            findListResult.setData(list);
            findListResult.setCount(cout);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return findListResult;
    }

    @Override
    public Forum findById(int id) {

        Forum forum = null;
        try {
            forum = forumMapper.selectById(id);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return forum;
    }
}
