package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.User.Post;
import com.User.UserDetails;

public class PostDAO {
	private Connection conn;

	public PostDAO(Connection conn) {
		super();
		// TODO Auto-generated constructor stub
		this.conn=conn;
	}
	
	public boolean AddNotes(String ti,String co, int ui)
	{
		boolean f=false;
		try {
			String query="insert into post(title,content,uid) values (?,?,?)";
			PreparedStatement ps=conn.prepareStatement (query); 
			
			ps.setString(1, ti); 
			ps.setString(2, co); 
			ps.setInt(3, ui);
			
			int i=ps.executeUpdate();
			if(i==1)
			{
				f=true;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return f;
	}
	
// Code Start to get all the post by the particular User 
	public List<Post> getData(int id){
		
		List<Post> list=new ArrayList<Post>();
		Post po=null;
		try {
			String query="select * from post where uid=? order by id DESC";
			PreparedStatement ps=conn.prepareStatement (query); 
			ps.setInt(1, id);
			
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				po=new Post();
				po.setId(rs.getInt(1));
				po.setTitle(rs.getString(2));
				po.setContent(rs.getString(3));
				po.setPdate(rs.getTimestamp(4));
				
				list.add(po);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
// Code End to get all the post by the particular User
	
	
	
	
	
	
// Code Start to get all the post by the particular User ID for the edit Notes
		public Post getDataById(int nodeId){
			
			//List<Post> list=new ArrayList<Post>();
			Post p=null;
			try {
				Connection conn = this.conn;
				String query="select * from post where uid=?";
				PreparedStatement ps=conn.prepareStatement (query); 
				ps.setInt(1, nodeId);
				
				ResultSet rs=ps.executeQuery();
				while(rs.next()) {
					p=new Post();
					p.setId(rs.getInt(1));
					p.setTitle(rs.getString(2));
					p.setContent(rs.getString(3));
					
				}
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			return p;
		}
// Code End to get all the post by the particular User
		
		
// Code Start to Update the post by the particular User ID for the edit Notes
		public boolean UpdateNotes(int nid,String ti, String con)
		{
			boolean f=false;
			try {
				String query="update post set title=?, content=? where id=?";
				PreparedStatement ps=conn.prepareStatement (query); 
				
				
				ps.setString(1, ti); 
				ps.setString(2, con); 
				ps.setInt(3, nid);
				
				int i=ps.executeUpdate();
				if(i==1)
				{
					f=true;
				}
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			return f;
		}
// Code End to Update the post by the particular User ID for the edit Notes
		
		

// Code Start (to delete the post by the particular User ID)
				public boolean deleteNotes(int nid)
				{
					boolean f=false;
					try {
						String query="delete from post where id=?";
						PreparedStatement ps=conn.prepareStatement (query); 
						
						ps.setInt(1, nid);
						
						int i=ps.executeUpdate();
						if(i==1)
						{
							f=true;
						}
					}
					catch(Exception e)
					{
						e.printStackTrace();
					}
					return f;
				}
		// Code End (to Update the post by the particular User ID)	
		
}
