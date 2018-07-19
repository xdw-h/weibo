package com.weibo.action;

import com.opensymphony.xwork2.ActionSupport;
import com.weibo.dao.WeiboDAO;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import java.util.List;

@Controller
@ParentPackage("default")
public class WeiboAction extends ActionSupport {

    private List weibos;
    private Integer offset;
    @Autowired
    private WeiboDAO weiboDAO;

    @Action(value = "weiboList", results = @Result(type = "json", params = {"root", "weibos"}))
    public String getWeiboList() {
        if (offset == null) {
            offset = 0;
        }
        weibos = weiboDAO.getAll(offset);
        return SUCCESS;
    }

    public Integer getOffset() {
        return offset;
    }

    public void setOffset(Integer offset) {
        this.offset = offset;
    }

    public List getWeibos() {
        return weibos;
    }

    public void setWeibos(List weibos) {
        this.weibos = weibos;
    }
}
