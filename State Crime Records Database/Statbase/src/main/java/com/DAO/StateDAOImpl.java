package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.entity.StateDtls;

public class StateDAOImpl implements StatesDAO{
	
	private Connection conn;
	
	public StateDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}
	

	public boolean addStates(StateDtls s) {
		boolean f = false;
		try {
			String sql="insert into states(statename, year, stolen, recovered, percentager) values(?,?,?,?,?)";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, s.getStatename());
			ps.setInt(2, s.getYear());
			ps.setDouble(3, s.getStolen());
			ps.setDouble(4, s.getRecovered());
			ps.setDouble(5, s.getPercentager());
			
			int i = ps.executeUpdate();
			
			if(i==1) {
				f = true;
			}
			
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}



	
	
	
}
