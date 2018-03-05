package org.zyj.vo;

import org.springframework.web.multipart.MultipartFile;

import java.io.Serializable;

/**
 * Created by xingmao on 2018/2/9.
 */
public class FileUpload implements Serializable{

	private String fileName;

	private MultipartFile image;

	public FileUpload() {
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public MultipartFile getImage() {
		return image;
	}

	public void setImage(MultipartFile image) {
		this.image = image;
	}
}
