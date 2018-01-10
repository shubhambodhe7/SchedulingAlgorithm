package com.controller.vesit;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dto.vesit.Sport;
import com.services.vesit.ProjectService;

@Controller
public class ProjectController {

	@Autowired
	ProjectService ps;
	
	
	

	public ProjectController() {
		super();
	}

	public ProjectController(ProjectService ps) {
		super();
		this.ps = ps;
	}

	@RequestMapping(value = "/getAllSports", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<Sport> getAllSports() {
		// System.out.println("in getEmployee mapping method");
		return ps.getAllSports();
	}

}
