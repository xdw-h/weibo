package com.weibo.entity;

import java.sql.Timestamp;

/**
 * Comment entity. @author MyEclipse Persistence Tools
 */

public class Comments implements java.io.Serializable {

	// Fields

	private Integer id;
	private String author;
	private String content;
	private Integer wfrom;
	private String wtype;
	private Timestamp postdate;
	private Integer highlight;
	private Integer weiboid;

	// Constructors

	/** default constructor */
	public Comments() {
	}

	/** minimal constructor */
	public Comments(String wtype, Timestamp postdate, Integer highlight,
			Integer weiboid) {
		this.wtype = wtype;
		this.postdate = postdate;
		this.highlight = highlight;
		this.weiboid = weiboid;
	}

	/** full constructor */
	public Comments(String author, String content, Integer wfrom, String wtype,
			Timestamp postdate, Integer highlight, Integer weiboid) {
		this.author = author;
		this.content = content;
		this.wfrom = wfrom;
		this.wtype = wtype;
		this.postdate = postdate;
		this.highlight = highlight;
		this.weiboid = weiboid;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getAuthor() {
		return this.author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Integer getWfrom() {
		return this.wfrom;
	}

	public void setWfrom(Integer wfrom) {
		this.wfrom = wfrom;
	}

	public String getWtype() {
		return this.wtype;
	}

	public void setWtype(String wtype) {
		this.wtype = wtype;
	}

	public Timestamp getPostdate() {
		return this.postdate;
	}

	public void setPostdate(Timestamp postdate) {
		this.postdate = postdate;
	}

	public Integer getHighlight() {
		return this.highlight;
	}

	public void setHighlight(Integer highlight) {
		this.highlight = highlight;
	}

	public Integer getWeiboid() {
		return this.weiboid;
	}

	public void setWeiboid(Integer weiboid) {
		this.weiboid = weiboid;
	}

}