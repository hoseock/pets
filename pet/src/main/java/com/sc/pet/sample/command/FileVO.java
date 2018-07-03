package com.sc.pet.sample.command;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class FileVO {
	private List<MultipartFile> files;
	private String upDir;

	public List<MultipartFile> getFiles() {
		return files;
	}

	public String getUpDir() {
		return upDir;
	}

	public void setUpDir(String upDir) {
		this.upDir = upDir;
	}

	public void setFiles(List<MultipartFile> files) {
		this.files = files;
	}
}
