package com.tis.domain;

import org.springframework.beans.factory.annotation.Value;

import lombok.Data;
//@Data�� ���̸� setter, getter, equals(), toStriong()���� �ڵ�  �������ش�.
@Data
public class SampleVO {
	
	@Value("ȫ�浿") 
	private String name;
	
	@Value("22")
	private int age;

}
