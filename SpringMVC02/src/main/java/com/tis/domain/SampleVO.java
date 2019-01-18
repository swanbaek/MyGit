package com.tis.domain;

import org.springframework.beans.factory.annotation.Value;

import lombok.Data;
//@Data를 붙이면 setter, getter, equals(), toStriong()등을 자동  생성해준다.
@Data
public class SampleVO {
	
	@Value("홍길동") 
	private String name;
	
	@Value("22")
	private int age;

}
