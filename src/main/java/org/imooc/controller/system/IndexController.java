package org.imooc.controller.system;

import javax.servlet.http.HttpSession;

import org.imooc.constant.SessionKeyConst;
import org.imooc.dto.UserDto;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/index")
public class IndexController {

	/**
	 * 登录成功后，后台管理首页
	 */
	@RequestMapping
	public String init(Model model,HttpSession session) {
		UserDto userInfo = (UserDto)session.getAttribute(SessionKeyConst.USER_INFO);
		if(userInfo!=null){
			model.addAttribute("userinfo", userInfo);
		}
		return "/system/index";
	}
}
