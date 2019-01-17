package com.tis.myapp;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.ToString;

@Component
@Data
@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor//모든 매개변수를 받는 생성자를 만듦
@RequiredArgsConstructor //@NonNull이나 final이 붙은 변수에 대한 생성자를 만듦
public class TestDTO {
	@NonNull
	private String name;
	private int age;
	private String dept;

}
