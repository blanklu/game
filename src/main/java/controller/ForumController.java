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
import java.text.SimpleDateFormat;
import java.util.Date;

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

    @ResponseBody
    @RequestMapping("/article/add")
    public int toarticleadd(ArticleDto articleDto) {
        int i = 0;
        try {
            long l = System.currentTimeMillis();
            Date date = new Date(l);
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            String dateString = format.format(date);
            articleDto.setUpdatatime(dateString);
            System.out.println(articleDto);
            i = iArticleService.add(articleDto);
        } catch (Exception e) {
            e.printStackTrace();
        }
       return i;
    }


    @ResponseBody
    @RequestMapping("/article/tomess")
    public String toarticlemess(int id){
        System.out.println(id);
        return "";
    }

    @RequestMapping("/article/mess")
    public String articlemess(int id, Model model){
        Article article = null;
        try {
            article = iArticleService.findById(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("mess",article);
        System.out.println(article);
        return "articlemess";
    }


    @RequestMapping("/article/toupdate")
    public String toupdate(int id,Model model) {
        Article article = null;
        try {
            article  = iArticleService.findById(id);
            model.addAttribute("articlemess",article);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "update";
    }

    @ResponseBody
    @RequestMapping("/article/update")
    public int update(Article article) {
        int i = 0;
        try {
            long l = System.currentTimeMillis();
            Date date = new Date(l);
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            String dateString = format.format(date);
            article.setUpdatatime(dateString);
            i = iArticleService.modify(article);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return i;
    }



}
