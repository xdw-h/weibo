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
	private Integer from;
	private String type;
	private Timestamp postdate;
	private Integer highlight;

	// Constructors

	/** default constructor */
	public Comments() {
	}

	/** minimal constructor */
	public Comments(String type, Timestamp postdate, Integer highlight) {
		this.type = type;
		this.postdate = postdate;
		this.highlight = highlight;
	}

	/** full constructor */
	public Comments(String author, String content, Integer from, String type,
			Timestamp postdate, Integer highlight) {
		this.author = author;
		this.content = content;
		this.from = from;
		this.type = type;
		this.postdate = postdate;
		this.highlight = highlight;
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

	public Integer getFrom() {
		return this.from;
	}

	public void setFrom(Integer from) {
		this.from = from;
	}

	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
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

}