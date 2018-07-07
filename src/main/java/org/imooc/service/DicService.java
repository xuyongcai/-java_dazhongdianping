package org.imooc.service;

import java.util.List;

import org.imooc.bean.Dic;

public interface DicService {
	 List<Dic> getListByType(String type);
}
