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
@AllArgsConstructor//��� �Ű������� �޴� �����ڸ� ����
@RequiredArgsConstructor //@NonNull�̳� final�� ���� ������ ���� �����ڸ� ����
public class TestDTO {
	@NonNull
	private String name;
	private int age;
	private String dept;

}
