package com.weibo.action;

import com.opensymphony.xwork2.ActionSupport;
import com.weibo.dao.WeiboDAO;
import com.weibo.entity.Weibo;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
@ParentPackage("default")
public class PostWeiboAction extends ActionSupport {

    private Weibo weibo;
    private int status;
    @Autowired
    private WeiboDAO weiboDAO;

    @Action(value = "post",
            results = {@Result(type = "json", params = {"root", "status"})})
    public String post() {
        if (weibo == null) {
            status = -1;
        } else {
            weiboDAO.save(weibo);
            status = weibo.getId();
        }
        return SUCCESS;
    }

    public Weibo getWeibo() {
        return weibo;
    }

    public void setWeibo(Weibo weibo) {
        this.weibo = weibo;
    }

    public int isStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

}