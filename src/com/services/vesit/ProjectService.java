package com.services.vesit;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.vesit.ProjectDao;
import com.dto.vesit.Sport;

@Service
public class ProjectService {

	@Autowired
	ProjectDao pd = new ProjectDao();
	
	

	public ProjectService() {
		super();
	}

	public ProjectService(ProjectDao pd) {
		super();
		this.pd = pd;
	}

	public List<Sport> getAllSports() {
		return pd.getAllSports();
	}

}
