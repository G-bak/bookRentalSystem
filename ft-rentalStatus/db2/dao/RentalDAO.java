package db2.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db2.dto.RentalDTO;

import db2.util.DBConnectionManager;

public class RentalDAO {
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	
	// 리스트로 전체 대여 현황 조회
	public List<RentalDTO> selectAllRental() {
		
		List<RentalDTO> rentalList = null;
		
		try {
			conn = DBConnectionManager.connectDB();
			
			String query = " SELECT r.rentno, m.mname, b.bname, "
							+ "		TO_CHAR(r.rental_date, 'YYYY-MM-DD') rental_date, "
							+ "		TO_CHAR(r.return_date, 'YYYY-MM-DD') return_date, "
							+ "		TO_CHAR(r.od_date, 'YYYY-MM-DD') od_date, "
							+ "		TO_CHAR(r.stop_date, 'YYYY-MM-DD') stop_date, "
							+ "		TO_CHAR(r.comp_date, 'YYYY-MM-DD') comp_date, "
							+ "		rs.rstatus "
						    + " FROM rental r, memberInfo m, book b, rental_status rs "
							+ " WHERE r.membno = m.membno AND r.bookno = b.bookno "
							+ " 	AND r.rstatus_id = rs.rstatus_id "
							+ " ORDER BY r.rentno ";
					
			psmt = conn.prepareStatement(query);
			
			rs = psmt.executeQuery();
			
			rentalList = new ArrayList<RentalDTO>();
		
			while (rs.next()) {
				RentalDTO rental = new RentalDTO();
				rental.setRentno(rs.getInt("rentno"));
				rental.setMname(rs.getString("mname"));
				rental.setBname(rs.getString("bname"));
				rental.setRental_date(rs.getString("rental_date"));
				rental.setReturn_date(rs.getString("return_date"));
				rental.setOd_date(rs.getString("od_date") == null ? "" : rs.getString("od_date"));
				rental.setStop_date(rs.getString("stop_date") == null ? "" : rs.getString("stop_date"));
				rental.setComp_date(rs.getString("comp_date") == null ? "" : rs.getString("comp_date"));
				rental.setRstatus(rs.getString("rstatus"));
				
				rentalList.add(rental);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.disconnectDB(conn, psmt, rs); // Close resources properly
		}
		
		return rentalList;
	}
	
	// 리스트로 대여번호 기준으로 대여 현황 조회
	public List<RentalDTO> selectRentalByRentno(int rentno) {
		
		List<RentalDTO> rentalList = null;
		
		try {
			conn = DBConnectionManager.connectDB();
			
			String query = " SELECT r.rentno, m.mname, b.bname, "
							+ "		TO_CHAR(r.rental_date, 'YYYY-MM-DD') rental_date, "
							+ "		TO_CHAR(r.return_date, 'YYYY-MM-DD') return_date, "
							+ "		TO_CHAR(r.od_date, 'YYYY-MM-DD') od_date, "
							+ "		TO_CHAR(r.stop_date, 'YYYY-MM-DD') stop_date, "
							+ "		TO_CHAR(r.comp_date, 'YYYY-MM-DD') comp_date, "
							+ "		rs.rstatus "
						    + " FROM rental r, memberInfo m, book b, rental_status rs "
							+ " WHERE r.membno = m.membno AND r.bookno = b.bookno "
							+ " 	AND r.rstatus_id = rs.rstatus_id "
							+ "		AND r.rentno = ? "
							+ " ORDER BY r.rentno ";
					
			psmt = conn.prepareStatement(query);
			psmt.setInt(1, rentno);
			
			rs = psmt.executeQuery();
			
			rentalList = new ArrayList<RentalDTO>();
		
			while (rs.next()) {
				RentalDTO rental = new RentalDTO();
				rental.setRentno(rs.getInt("rentno"));
				rental.setMname(rs.getString("mname"));
				rental.setBname(rs.getString("bname"));
				rental.setRental_date(rs.getString("rental_date"));
				rental.setReturn_date(rs.getString("return_date"));
				rental.setOd_date(rs.getString("od_date") == null ? "" : rs.getString("od_date"));
				rental.setStop_date(rs.getString("stop_date") == null ? "" : rs.getString("stop_date"));
				rental.setComp_date(rs.getString("comp_date") == null ? "" : rs.getString("comp_date"));
				rental.setRstatus(rs.getString("rstatus"));
				
				rentalList.add(rental);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.disconnectDB(conn, psmt, rs); // Close resources properly
		}
		
		return rentalList;
	}
		
	public List<RentalDTO> selectRentalByMname(String mname) {
		
		List<RentalDTO> rentalList = null;
		
		try {
			conn = DBConnectionManager.connectDB();
			
			String query = " SELECT r.rentno, m.mname, b.bname, "
							+ "		TO_CHAR(r.rental_date, 'YYYY-MM-DD') rental_date, "
							+ "		TO_CHAR(r.return_date, 'YYYY-MM-DD') return_date, "
							+ "		TO_CHAR(r.od_date, 'YYYY-MM-DD') od_date, "
							+ "		TO_CHAR(r.stop_date, 'YYYY-MM-DD') stop_date, "
							+ "		TO_CHAR(r.comp_date, 'YYYY-MM-DD') comp_date, "
							+ "		rs.rstatus "
						    + " FROM rental r, memberInfo m, book b, rental_status rs "
							+ " WHERE r.membno = m.membno AND r.bookno = b.bookno "
							+ " 	AND r.rstatus_id = rs.rstatus_id "
							+ "		AND m.mname = ? "
							+ " ORDER BY r.rentno ";
					
			psmt = conn.prepareStatement(query);
			psmt.setString(1, mname);
			
			rs = psmt.executeQuery();
			
			rentalList = new ArrayList<RentalDTO>();
		
			while (rs.next()) {
				RentalDTO rental = new RentalDTO();
				rental.setRentno(rs.getInt("rentno"));
				rental.setMname(rs.getString("mname"));
				rental.setBname(rs.getString("bname"));
				rental.setRental_date(rs.getString("rental_date"));
				rental.setReturn_date(rs.getString("return_date"));
				rental.setOd_date(rs.getString("od_date") == null ? "" : rs.getString("od_date"));
				rental.setStop_date(rs.getString("stop_date") == null ? "" : rs.getString("stop_date"));
				rental.setComp_date(rs.getString("comp_date") == null ? "" : rs.getString("comp_date"));
				rental.setRstatus(rs.getString("rstatus"));
				
				rentalList.add(rental);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.disconnectDB(conn, psmt, rs); // Close resources properly
		}
		
		return rentalList;
	}
	
	public List<RentalDTO> selectRentalByBname(String bname) {
		
		List<RentalDTO> rentalList = null;
		
		try {
			conn = DBConnectionManager.connectDB();
			
			String query = " SELECT r.rentno, m.mname, b.bname, "
							+ "		TO_CHAR(r.rental_date, 'YYYY-MM-DD') rental_date, "
							+ "		TO_CHAR(r.return_date, 'YYYY-MM-DD') return_date, "
							+ "		TO_CHAR(r.od_date, 'YYYY-MM-DD') od_date, "
							+ "		TO_CHAR(r.stop_date, 'YYYY-MM-DD') stop_date, "
							+ "		TO_CHAR(r.comp_date, 'YYYY-MM-DD') comp_date, "
							+ "		rs.rstatus "
						    + " FROM rental r, memberInfo m, book b, rental_status rs "
							+ " WHERE r.membno = m.membno AND r.bookno = b.bookno "
							+ " 	AND r.rstatus_id = rs.rstatus_id "
							+ "		AND b.bname = ? "
							+ " ORDER BY r.rentno ";
					
			psmt = conn.prepareStatement(query);
			psmt.setString(1, bname);
			
			rs = psmt.executeQuery();
			
			rentalList = new ArrayList<RentalDTO>();
		
			while (rs.next()) {
				RentalDTO rental = new RentalDTO();
				rental.setRentno(rs.getInt("rentno"));
				rental.setMname(rs.getString("mname"));
				rental.setBname(rs.getString("bname"));
				rental.setRental_date(rs.getString("rental_date"));
				rental.setReturn_date(rs.getString("return_date"));
				rental.setOd_date(rs.getString("od_date") == null ? "" : rs.getString("od_date"));
				rental.setStop_date(rs.getString("stop_date") == null ? "" : rs.getString("stop_date"));
				rental.setComp_date(rs.getString("comp_date") == null ? "" : rs.getString("comp_date"));
				rental.setRstatus(rs.getString("rstatus"));
				
				rentalList.add(rental);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.disconnectDB(conn, psmt, rs); // Close resources properly
		}
		
		return rentalList;
	}
	
	public List<RentalDTO> selectRentalByStartDate(String startDate) {
		
		List<RentalDTO> rentalList = null;
		
		try {
			conn = DBConnectionManager.connectDB();
			
			String query = " SELECT r.rentno, m.mname, b.bname, "
							+ "		TO_CHAR(r.rental_date, 'YYYY-MM-DD') rental_date, "
							+ "		TO_CHAR(r.return_date, 'YYYY-MM-DD') return_date, "
							+ "		TO_CHAR(r.od_date, 'YYYY-MM-DD') od_date, "
							+ "		TO_CHAR(r.stop_date, 'YYYY-MM-DD') stop_date, "
							+ "		TO_CHAR(r.comp_date, 'YYYY-MM-DD') comp_date, "
							+ "		rs.rstatus "
						    + " FROM rental r, memberInfo m, book b, rental_status rs "
							+ " WHERE r.membno = m.membno AND r.bookno = b.bookno "
							+ " 	AND r.rstatus_id = rs.rstatus_id "
							+ "		AND TO_CHAR(r.rental_date, 'YYYY-MM-DD') = ? "
							+ " ORDER BY r.rentno ";
					
			psmt = conn.prepareStatement(query);
			psmt.setString(1, startDate);
			
			rs = psmt.executeQuery();
			
			rentalList = new ArrayList<RentalDTO>();
		
			while (rs.next()) {
				RentalDTO rental = new RentalDTO();
				rental.setRentno(rs.getInt("rentno"));
				rental.setMname(rs.getString("mname"));
				rental.setBname(rs.getString("bname"));
				rental.setRental_date(rs.getString("rental_date"));
				rental.setReturn_date(rs.getString("return_date"));
				rental.setOd_date(rs.getString("od_date") == null ? "" : rs.getString("od_date"));
				rental.setStop_date(rs.getString("stop_date") == null ? "" : rs.getString("stop_date"));
				rental.setComp_date(rs.getString("comp_date") == null ? "" : rs.getString("comp_date"));
				rental.setRstatus(rs.getString("rstatus"));
				
				rentalList.add(rental);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.disconnectDB(conn, psmt, rs); // Close resources properly
		}
		
		return rentalList;
	}
	
	public List<RentalDTO> selectRentalByStartDateEndDate(String startDate, String endDate) {
		
		List<RentalDTO> rentalList = null;
		
		try {
			conn = DBConnectionManager.connectDB();
			
			String query = " SELECT r.rentno, m.mname, b.bname, "
							+ "		TO_CHAR(r.rental_date, 'YYYY-MM-DD') rental_date, "
							+ "		TO_CHAR(r.return_date, 'YYYY-MM-DD') return_date, "
							+ "		TO_CHAR(r.od_date, 'YYYY-MM-DD') od_date, "
							+ "		TO_CHAR(r.stop_date, 'YYYY-MM-DD') stop_date, "
							+ "		TO_CHAR(r.comp_date, 'YYYY-MM-DD') comp_date, "
							+ "		rs.rstatus "
						    + " FROM rental r, memberInfo m, book b, rental_status rs "
							+ " WHERE r.membno = m.membno AND r.bookno = b.bookno "
							+ " 	AND r.rstatus_id = rs.rstatus_id "
							+ "		AND TO_CHAR(r.rental_date, 'YYYY-MM-DD') "
							+ "         BETWEEN ? AND ? "
							+ " ORDER BY r.rentno ";
					
			psmt = conn.prepareStatement(query);
			psmt.setString(1, startDate);
			psmt.setString(2, endDate);
			
			rs = psmt.executeQuery();
			
			rentalList = new ArrayList<RentalDTO>();
		
			while (rs.next()) {
				RentalDTO rental = new RentalDTO();
				rental.setRentno(rs.getInt("rentno"));
				rental.setMname(rs.getString("mname"));
				rental.setBname(rs.getString("bname"));
				rental.setRental_date(rs.getString("rental_date"));
				rental.setReturn_date(rs.getString("return_date"));
				rental.setOd_date(rs.getString("od_date") == null ? "" : rs.getString("od_date"));
				rental.setStop_date(rs.getString("stop_date") == null ? "" : rs.getString("stop_date"));
				rental.setComp_date(rs.getString("comp_date") == null ? "" : rs.getString("comp_date"));
				rental.setRstatus(rs.getString("rstatus"));
				
				rentalList.add(rental);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.disconnectDB(conn, psmt, rs); // Close resources properly
		}
		
		return rentalList;
	}
	
	// 리스트로 대여상태 기준으로 대여 현황 조회
	public List<RentalDTO> selectRentalByRstatus(String rstatus) {
		
		List<RentalDTO> rentalList = null;
		
		try {
			conn = DBConnectionManager.connectDB();
			
			String query = " SELECT r.rentno, m.mname, b.bname, "
							+ "		TO_CHAR(r.rental_date, 'YYYY-MM-DD') rental_date, "
							+ "		TO_CHAR(r.return_date, 'YYYY-MM-DD') return_date, "
							+ "		TO_CHAR(r.od_date, 'YYYY-MM-DD') od_date, "
							+ "		TO_CHAR(r.stop_date, 'YYYY-MM-DD') stop_date, "
							+ "		TO_CHAR(r.comp_date, 'YYYY-MM-DD') comp_date, "
							+ "		rs.rstatus "
						    + " FROM rental r, memberInfo m, book b, rental_status rs "
							+ " WHERE r.membno = m.membno AND r.bookno = b.bookno "
							+ " 	AND r.rstatus_id = rs.rstatus_id "
							+ "		AND r.rstatus_id = ? "
							+ " ORDER BY r.rentno ";
					
			psmt = conn.prepareStatement(query);
			psmt.setString(1, rstatus);
			
			rs = psmt.executeQuery();
			
			rentalList = new ArrayList<RentalDTO>();
		
			while (rs.next()) {
				RentalDTO rental = new RentalDTO();
				rental.setRentno(rs.getInt("rentno"));
				rental.setMname(rs.getString("mname"));
				rental.setBname(rs.getString("bname"));
				rental.setRental_date(rs.getString("rental_date"));
				rental.setReturn_date(rs.getString("return_date"));
				rental.setOd_date(rs.getString("od_date") == null ? "" : rs.getString("od_date"));
				rental.setStop_date(rs.getString("stop_date") == null ? "" : rs.getString("stop_date"));
				rental.setComp_date(rs.getString("comp_date") == null ? "" : rs.getString("comp_date"));
				rental.setRstatus(rs.getString("rstatus"));
				
				rentalList.add(rental);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.disconnectDB(conn, psmt, rs); // Close resources properly
		}
		
		return rentalList;
	}
		
}