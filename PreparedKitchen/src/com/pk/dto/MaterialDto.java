package com.pk.dto;

public class MaterialDto {

	private int material_no;
	private int recipe_no;
	private String material_name;
	private String material_capacity;
	private int material_typeCode;
	private String material_typeName;
	
	public MaterialDto() {}

	public MaterialDto(int material_no, int recipe_no, String material_name, String material_capacity,
			int material_typeCode, String material_typeName) {
		this.material_no = material_no;
		this.recipe_no = recipe_no;
		this.material_name = material_name;
		this.material_capacity = material_capacity;
		this.material_typeCode = material_typeCode;
		this.material_typeName = material_typeName;
	}

	public int getMaterial_no() {
		return material_no;
	}

	public void setMaterial_no(int material_no) {
		this.material_no = material_no;
	}

	public int getRecipe_no() {
		return recipe_no;
	}

	public void setRecipe_no(int recipe_no) {
		this.recipe_no = recipe_no;
	}

	public String getMaterial_name() {
		return material_name;
	}

	public void setMaterial_name(String material_name) {
		this.material_name = material_name;
	}

	public String getMaterial_capacity() {
		return material_capacity;
	}

	public void setMaterial_capacity(String material_capacity) {
		this.material_capacity = material_capacity;
	}

	public int getMaterial_typeCode() {
		return material_typeCode;
	}

	public void setMaterial_typeCode(int material_typeCode) {
		this.material_typeCode = material_typeCode;
	}

	public String getMaterial_typeName() {
		return material_typeName;
	}

	public void setMaterial_typeName(String material_typeName) {
		this.material_typeName = material_typeName;
	}
	
	
}
