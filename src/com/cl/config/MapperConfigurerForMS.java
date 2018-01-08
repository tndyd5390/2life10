package com.cl.config;

import org.mybatis.spring.mapper.MapperScannerConfigurer;

public class MapperConfigurerForMS extends MapperScannerConfigurer {

	public MapperConfigurerForMS() {
		super.setAnnotationClass(MapperForMS.class);
		super.setSqlSessionFactoryBeanName("sqlSessionForMS");
	}
	
}
