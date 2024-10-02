package br.com.tcc.vanApp.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="condutores")
public class Condutor {
	
	@Id
	@Column(name = "CNH", length = 200, nullable = false)
	private String cnh;
	
	@Column(name = "Name", length = 200, nullable = false)
	private String name;
	
	@Column(name = "imgpath", length = 200)
	private String imgPath;
	
	public String getCnh() {
		return cnh;
	}
	public void setCnh(String cnh) {
		this.cnh = cnh;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getImgPath() {
		return imgPath;
	}
	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}
	
	

}
