package service.impl;

import mapper.ArticleMapper;
import model.Article;
import model.FindListResult;
import model.PageArc;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.IArticleService;

import java.util.List;

@Service
public class ArticleService implements IArticleService {

    @Autowired
    private ArticleMapper articleMapper;


    @Override
    public FindListResult findList(PageArc page) {
        FindListResult findListResult = new FindListResult();
        findListResult.setCode(0);
        findListResult.setMsg("success");
        try {
            List<Article> list = articleMapper.selectList(page);
            int cout = articleMapper.selectCount(page);
            findListResult.setData(list);
            findListResult.setCount(cout);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return findListResult;
    }

    @Override
    public int remove(int id) {
        int i = 0;
        try {
            i = articleMapper.delete(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return i;
    }
}
