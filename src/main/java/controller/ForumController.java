package controller;

import model.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import service.IArticleService;
import service.IForumService;

import javax.servlet.http.HttpSession;

@Controller
public class ForumController {

    @Autowired
    private IForumService iForumService;

    @Autowired
    private IArticleService iArticleService;

    @ResponseBody
    @RequestMapping(value = "/forums",method = RequestMethod.GET)
    public Object forums(Page page) {

        FindListResult findListResult = iForumService.findList(page);

        return findListResult;
    }


    @ResponseBody
    @RequestMapping(value = "/toarticle",method = RequestMethod.GET)
    public String toarticle(int id) {
        System.out.println(id);
        return "";
    }

    @RequestMapping("/article")
    public String article(int id,HttpSession senssion) {

        senssion.setAttribute("sessionForumId",id);
        Forum forum = iForumService.findById(id);
        senssion.setAttribute("sessionFroumName",forum.getForumName());

        return "article";
    }

    @ResponseBody
    @RequestMapping(value = "/articles",method = RequestMethod.GET)
    public Object articles(PageArc page, HttpSession session) {

        FindListResult findListResult = null;
        System.out.println(page.getTitle());

        try {

            int id = (int) session.getAttribute("sessionForumId");
            page.setId(id);
            findListResult = iArticleService.findList(page);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return findListResult;
    }

    @ResponseBody
    @RequestMapping("/article/del")
    public int del(int id) {

        int i = 0;
        try {
            i = iArticleService.remove(id);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return i;
    }


}
