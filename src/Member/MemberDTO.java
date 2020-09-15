package Member;

import java.sql.Date;

public class MemberDTO {

	
     private int m_userNo;  
	 private String m_id ;   
	 private String m_pw ;   
	 private String m_img;   
	 private String m_email; 
	 private String m_phone; 
	 private Date m_date   ;
	 private int m_admin   ;
	public int getM_userNo() {
		return m_userNo;
	}
	public void setM_userNo(int m_userNo) {
		this.m_userNo = m_userNo;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getM_pw() {
		return m_pw;
	}
	public void setM_pw(String m_pw) {
		this.m_pw = m_pw;
	}
	public String getM_img() {
		return m_img;
	}
	public void setM_img(String m_img) {
		this.m_img = m_img;
	}
	public String getM_email() {
		return m_email;
	}
	public void setM_email(String m_email) {
		this.m_email = m_email;
	}
	public String getM_phone() {
		return m_phone;
	}
	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}
	public Date getM_date() {
		return m_date;
	}
	public void setM_date(Date m_date) {
		this.m_date = m_date;
	}
	public int getM_admin() {
		return m_admin;
	}
	public void setM_admin(int m_admin) {
		this.m_admin = m_admin;
	}
	 
	 
	 
	 
	 
	 
}
