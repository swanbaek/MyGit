package com.tis.persistence;

import static org.junit.Assert.fail;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.junit.Test;

import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;

//@Slf4j
@Log4j
public class JDBCTests {
	
	String url="jdbc:oracle:thin:@localhost:1521:XE";
	String user="scott", pwd="tiger";
	static {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Test
	public void testConnection() {
		//fail("Not yet implemented");
		try(Connection con=DriverManager.getConnection(url,user,pwd)){
			String sql="select count(*) from tab";
			PreparedStatement ps=con.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			rs.next();
			int cnt=rs.getInt(1);
			rs.close();
			ps.close();
			log.info("°Ô½Ã±Û °¹¼ö: "+cnt);
		}catch(Exception e) {
			fail(e.getMessage());
		}
	}

}
