package com.sist.main;

import com.sist.mento.MentoService;
import com.sist.mento.MentoVO;
import com.sist.space.ReviewVO;
import com.sist.space.SpaceService;
import com.sist.study.StudyService;
import com.sist.study.StudyVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.List;

@Controller
public class MainController {
	private StudyService studyService;
	private MentoService mentoService;
	private SpaceService spaceService;
	
	@Autowired
	public MainController(StudyService studyService, MentoService mentoService,SpaceService spaceService) {
		this.mentoService = mentoService;
		this.studyService = studyService;
		this.spaceService = spaceService;
	}

	@GetMapping("main/main.do")
	public String main_main(Model model)
	{
		List<StudyVO> sList = studyService.getFourDeadlineStudy();
		List<MentoVO> mList = mentoService.getMostFollowedMento();
		List<Long> dayDiff = new ArrayList<>();
		LocalDate today = LocalDate.now();
		for(StudyVO vo : sList){
			LocalDate date = LocalDate.parse(vo.getDeadline(), DateTimeFormatter.ofPattern("yyyy-MM-dd"));
			dayDiff.add(ChronoUnit.DAYS.between(today, date));
		}
		List<ReviewVO> rList = spaceService.spaceTop3RecentReview();
		model.addAttribute("rList", rList);
		model.addAttribute("mList", mList);
		model.addAttribute("sList", sList);
		model.addAttribute("dayDiff", dayDiff);
		return "main";
	}
}
