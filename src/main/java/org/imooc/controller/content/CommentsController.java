package org.imooc.controller.content;

import org.imooc.dto.CommentDto;
import org.imooc.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/comments")
public class CommentsController {
	
	@Autowired
	private CommentService commentService;

	/**
	 * 评论列表
	 */
	@RequestMapping(method = RequestMethod.GET)
	public String Search(Model model,CommentDto commentDto) {
		model.addAttribute("searchParam",commentDto);
		//TODO 还有列表数据需要添加
		return "/content/commentList";
	}
	
	/**
	 * 删除评论
	 */
	@RequestMapping(value = "/{id}",method = RequestMethod.DELETE)
	public String remove(@PathVariable("id") Long id,Model model){
		
		return "";
	}
	
}
