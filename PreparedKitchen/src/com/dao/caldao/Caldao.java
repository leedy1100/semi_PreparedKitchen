package com.dao.caldao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.dto.caldto.Caldto;

import common.JDBCTemplate;

public class Caldao extends JDBCTemplate{
	
	public Caldto mycal(String id) {
		
		Caldto dto = new Caldto();
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		
		String sql = " SELECT R.RECIPE_NAME, P.PAYMENT_DATE, M.MATERIAL_NAME FROM RECIPE R, PAYMENT P, MATERIAL M WHERE P.ID = ? ";
		
		try {
			pstm = con.prepareStatement(sql);
			
			pstm.setString(1, id);
			rs = pstm.executeQuery();
			
			while(rs.next()) {
				dto.setTitle(rs.getString(1));
				dto.setPaymentdate(rs.getDate(2));
				dto.setMaterialname(rs.getString(3));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
			close(con);
		}
		
		return dto;
	}

}
