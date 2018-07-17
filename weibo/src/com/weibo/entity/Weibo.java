package com.weibo.entity;

import java.sql.Timestamp;

/**
 * Weibo entity. @author MyEclipse Persistence Tools
 */

public class Weibo implements java.io.Serializable {

	// Fields

	private Integer id;
	private String title;
	private String content;
	private Integer author;
	private Timestamp posttime;
	private Timestamp updatetime;

	// Constructors

	/** default constructor */
	public Weibo() {
	}

	/** full constructor */
	public Weibo(String title, String content, Integer author,
			Timestamp posttime, Timestamp updatetime) {
		this.title = title;
		this.content = content;
		this.author = author;
		this.posttime = posttime;
		this.updatetime = updatetime;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Integer getAuthor() {
		return this.author;
	}

	public void setAuthor(Integer author) {
		this.author = author;
	}

	public Timestamp getPosttime() {
		return this.posttime;
	}

	public void setPosttime(Timestamp posttime) {
		this.posttime = posttime;
	}

	public Timestamp getUpdatetime() {
		return this.updatetime;
	}

	public void setUpdatetime(Timestamp updatetime) {
		this.updatetime = updatetime;
	}

}