package com.tis.domain;

import lombok.Data;
//@Data를 붙이면 setter, getter, equals(), toStriong()등을 자동  생성해준다.
@Data
public class SampleVO {
	
	private String name;
	private int age;

}
