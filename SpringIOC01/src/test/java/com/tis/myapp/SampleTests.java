package com.tis.myapp;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.tis.sample.Restaurant;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class SampleTests {
	
	@Setter(onMethod_= {@Autowired})
	private Restaurant rest;
	
	//@Test: �׽�Ʈ ����� ǥ���ϴ� ������̼�
	@Test
	public void testExist() {
		//rest�� null�� �ƴϾ�߸� �׽�Ʈ�� �����Ѵٴ� ���� �ǹ�
		assertNotNull(rest);
		log.info(rest);
		log.info("------------------");
		log.info(rest.getChef());
	}
}
