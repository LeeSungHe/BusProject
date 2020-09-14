package SampleDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;


import DBConnect.DBConnect;

public class SampleDAO {
	DBConnect dbconnect = null;
	
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;

	
	//DB연결
	public SampleDAO() { 
		dbconnect = new DBConnect(); 
	}
	//����
	public int Sample() {
		con = dbconnect.getConnection();
		int sample = 0;
		try {
			String sql = "";
			pstmt=con.prepareStatement(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
		
		}
		return sample;
	}
}
