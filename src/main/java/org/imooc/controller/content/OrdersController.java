package org.imooc.controller.content;


import org.imooc.dto.OrdersDto;
import org.imooc.service.OrdersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/orders")
public class OrdersController {
	
	@Autowired
	private OrdersService ordersService;
	
	@RequestMapping
	public String Search(Model model,OrdersDto ordersDto) {
		model.addAttribute("list",ordersService.searchByPage(ordersDto));
		model.addAttribute("searchParam",ordersDto);
		return "/content/orderList";
	}
}
