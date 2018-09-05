package service;

import model.FindListResult;
import model.PageArc;

public interface IArticleService {

    FindListResult findList(PageArc page);

    int remove(int id);
}
