package com.bk.tuanpm.webtoeic.dto;

import java.util.List;


public class ExamDTO {

    private Integer baithithuid;
    private String tenbaithithu;
    private String anhbaithithu;
    private String description;
    private String level;
    private String urlExcel;
    private String urlThumbnail;
    private String excelName;
    private List<String> urlImgs;
    private List<String> urlAudios;
	public Integer getBaithithuid() {
		return baithithuid;
	}
	public void setBaithithuid(Integer baithithuid) {
		this.baithithuid = baithithuid;
	}
	public String getTenbaithithu() {
		return tenbaithithu;
	}
	public void setTenbaithithu(String tenbaithithu) {
		this.tenbaithithu = tenbaithithu;
	}
	public String getAnhbaithithu() {
		return anhbaithithu;
	}
	public void setAnhbaithithu(String anhbaithithu) {
		this.anhbaithithu = anhbaithithu;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	public String getUrlExcel() {
		return urlExcel;
	}
	public void setUrlExcel(String urlExcel) {
		this.urlExcel = urlExcel;
	}
	public List<String> getUrlImgs() {
		return urlImgs;
	}
	public void setUrlImgs(List<String> urlImgs) {
		this.urlImgs = urlImgs;
	}
	public List<String> getUrlAudios() {
		return urlAudios;
	}
	public void setUrlAudios(List<String> urlAudios) {
		this.urlAudios = urlAudios;
	}
	public String getExcelName() {
		return excelName;
	}
	public void setExcelName(String excelName) {
		this.excelName = excelName;
	}
	public String getUrlThumbnail() {
		return urlThumbnail;
	}
	public void setUrlThumbnail(String urlThumbnail) {
		this.urlThumbnail = urlThumbnail;
	}
    
}
