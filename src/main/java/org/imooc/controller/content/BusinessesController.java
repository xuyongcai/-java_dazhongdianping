package org.imooc.controller.content;

import org.imooc.constant.DicTypeConst;
import org.imooc.constant.PageCodeEnum;
import org.imooc.dto.BusinessDto;
import org.imooc.service.BusinessService;
import org.imooc.service.DicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping("/businesses")
public class BusinessesController {
	
	@Autowired
	private DicService dicService;
	
	@Autowired
	private BusinessService businessService;
	
	/**
	 * 商户列表
	 */
	@RequestMapping(method = RequestMethod.GET)
	public String Search(Model model,BusinessDto dto){
		model.addAttribute("list",businessService.searchByPage(dto));
		model.addAttribute("searchParam",dto);	
		return "/content/businessList";
	}
	
	/**
	 * 删除商户
	 */
	@RequestMapping(value = "/{id}",method = RequestMethod.DELETE)
	public String remove(@PathVariable("id") Long id,Model model){
		System.out.println(id);
		if(businessService.remove(id)){
			model.addAttribute(PageCodeEnum.KEY, PageCodeEnum.REMOVE_SUCCESS);
		}else{
			model.addAttribute(PageCodeEnum.KEY, PageCodeEnum.REMOVE_FAIL);
		}
		return "redirect:/businesses";
	}
	
	/**
	 * 商户新增页初始化
	 */
	@RequestMapping(value = "/addPage",method = RequestMethod.GET)
	public String addInit(Model model){
		model.addAttribute("cityList",dicService.getListByType(DicTypeConst.CITY));
		model.addAttribute("categoryList",dicService.getListByType(DicTypeConst.CATEGORY));
		return "/content/businessAdd";
	}
	
	/**
	 * 商户新增
	 */
	@RequestMapping(method = RequestMethod.POST)
	public String add(BusinessDto businessDto, Model model){
		if(businessService.add(businessDto)){
			model.addAttribute(PageCodeEnum.KEY, PageCodeEnum.ADD_SUCCESS);
			return "redirect:/businesses";
		}else{
			model.addAttribute(PageCodeEnum.KEY, PageCodeEnum.ADD_FAIL);
			return "redirect:/businesses/addPage";
		}
	}
	
	/**
	 * 商户修改页初始化
	 */
	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public String modifyInit(Model model,@PathVariable("id") Long id){
		model.addAttribute("cityList", dicService.getListByType(DicTypeConst.CITY));
		model.addAttribute("categoryList", dicService.getListByType(DicTypeConst.CATEGORY));
		model.addAttribute("modifyObj",businessService.getById(id));
		return "/content/businessModify";
	}
	
	/**
	 * 商户修改
	 */
	@RequestMapping(value = "/{id}", method = RequestMethod.PUT)
	public String modify(@PathVariable("id") Long id, Model model, BusinessDto businessDto) {
		model.addAttribute("cityList", dicService.getListByType(DicTypeConst.CITY));
		model.addAttribute("categoryList", dicService.getListByType(DicTypeConst.CATEGORY));

		if(businessService.modify(businessDto)){
			model.addAttribute("modifyObj", businessDto);	
			
			model.addAttribute(PageCodeEnum.KEY, PageCodeEnum.MODIFY_SUCCESS);
		}else{
			model.addAttribute(PageCodeEnum.KEY, PageCodeEnum.MODIFY_FAIL);
		}
		return "redirect:/businesses/" + id;
	}
}
