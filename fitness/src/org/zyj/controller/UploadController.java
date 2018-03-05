package org.zyj.controller;

import org.apache.commons.io.FileUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.zyj.vo.FileUpload;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;

/**
 * Created by xingmao on 2018/2/9.
 */
@Controller
@RequestMapping("/file")
public class UploadController {

	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public String uploadFile(HttpServletRequest request, @RequestParam("file") MultipartFile file) throws IOException {
		if (file.isEmpty()) {
			return "error";
		} else {
			String realPath = request.getServletContext().getRealPath("/images/");
			String fileName = file.getOriginalFilename();

			File filePath = new File(realPath, fileName);

			if (!filePath.getParentFile().exists()) {
				filePath.getParentFile().mkdirs();
			}

			file.transferTo(new File(realPath + File.separator + fileName));
			return "uploadfile/success";
		}
	}

	@RequestMapping(value = "/newupload", method = RequestMethod.POST)
	public String newuploadFile(HttpServletRequest request, @ModelAttribute FileUpload fileUpload, ModelMap modelMap) throws IOException {
		if (fileUpload.getImage().isEmpty()) {
			return "error";
		} else {
			String realPath = request.getServletContext().getRealPath("/images/");
			String fileName = fileUpload.getImage().getOriginalFilename();

			File filePath = new File(realPath, fileName);

			if (!filePath.getParentFile().exists()) {
				filePath.getParentFile().mkdirs();
			}

			fileUpload.getImage().transferTo(new File(realPath + File.separator + fileName));
			modelMap.addAttribute("fileupload",fileUpload);
			return "uploadfile/fileupload";
		}
	}

	@RequestMapping("/download")
	public ResponseEntity<byte[]> download(HttpServletRequest request,
	                                       @RequestParam("filename") String filename, ModelMap modelMap) throws IOException {
		String realPath = request.getServletContext().getRealPath("/images/");
		File file = new File(realPath + File.separator + filename);
		HttpHeaders headers = new HttpHeaders();
		String downloadName = new String(filename.getBytes("UTF-8"),"iso-8859-1");
		headers.setContentDispositionFormData("attachment", downloadName);
		headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);

		return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file), headers, HttpStatus.CREATED);
	}
}
