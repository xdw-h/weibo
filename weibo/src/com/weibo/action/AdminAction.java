package com.weibo.action;




import java.util.Map;


import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.weibo.entity.Usermsg;
import com.weibo.service.IAdminService;

public class AdminAction extends ActionSupport {
	String info;
	Usermsg u;
	IAdminService adminService;
	private int id;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
    public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	

	public Usermsg getU() {
		return u;
	}

	public void setU(Usermsg u) {
		this.u = u;
	}

	public IAdminService getAdminService() {
		return adminService;
	}

	public void setAdminService(IAdminService adminService) {
		this.adminService = adminService;
	}

	public String login(){
	   if (adminService.login(u)){
			return SUCCESS;
	}else {
		    info="µÇÂ½Ê§°Ü";
		    return INPUT;
   }
}
	public String logout() {
		Map session = ActionContext.getContext().getSession();
		session.remove("login");
		return SUCCESS;
	}
	   public String queryName(){
			if (adminService.queryName(u.getUsername())){
				info="has";
			}
			else{
				info="no";
			}
			return SUCCESS;
		}
	   public String register(){
		   adminService.register(u);
		   return SUCCESS;
	   }
		public String updateload() {
			adminService.queryOne(id);
			return "success";
		}

		public String updateAdmin() {
			adminService.updateAdmin(u);
			return "success";
		}
}