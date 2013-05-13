package edu.fyp.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import edu.fyp.bean.Form;
import edu.fyp.manager.FormManager;

@Controller
public class PathController {
	
	@Autowired
	private FormManager formManager;
	
	@RequestMapping("/path")
	public  ModelAndView path(){
		ModelAndView mav = new ModelAndView("path/pathbuilder");
		return mav;
	}
	
	@RequestMapping(value="/path",params="{formKey}")
	public  ModelAndView pathWithFormKey(@RequestParam(value="formKey", required=true)String formKey){
		ModelAndView mav = new ModelAndView("path/pathbuilder");
		Form form = formManager.getFormByFormKey(formKey);
		mav.addObject("path", form.getPath().getValue());
		mav.addObject("formKey", formKey);
		return mav;
	}
	
	
	
	@RequestMapping("/searchUserPanel")
	public  ModelAndView searchUserPanel(){
		ModelAndView mav = new ModelAndView("path/searchUser");
		return mav;
	}

}
