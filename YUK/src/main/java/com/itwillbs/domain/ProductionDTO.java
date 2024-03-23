package com.itwillbs.domain;

public class ProductionDTO {
	
	// ���� �������
	private String lineCode;
	private String lineName;
	private String update;
	private String name;
	private int lineStatus;
	
	// �۾����� ��� ����
	private String instructionCode;	// �۾������ڵ�
	private int insVol;				// ���ü���
	private String instructionDate;	// �۾�������
	private int instractionStatus;	// �۾�����

	private String contractCode;	// �����ڵ�
	private int contractVol;		// ���ַ�
	private String contractDueDate;	// ������
	private String contractDate;	// ���� ������
	private int conInfoStatus;		// ���� ����
	private String paymentDate;		// ������

	private String productName;		// ǰ���̸�
	private String productCode;		// ǰ���ڵ�
	
	
	@Override
	public String toString() {
		return "ProductionDTO [lineCode=" + lineCode + ", lineName=" + lineName + ", update=" + update + ", name="
				+ name + ", lineStatus=" + lineStatus + ", instructionCode=" + instructionCode + ", insVol=" + insVol
				+ ", instructionDate=" + instructionDate + ", instractionStatus=" + instractionStatus
				+ ", contractCode=" + contractCode + ", contractVol=" + contractVol + ", contractDueDate="
				+ contractDueDate + ", contractDate=" + contractDate + ", conInfoStatus=" + conInfoStatus
				+ ", paymentDate=" + paymentDate + ", productName=" + productName + ", productCode=" + productCode
				+ "]";
	}
	
	// ���ΰ��� getter/setter
	public String getLineCode() {
		return lineCode;
	}
	public void setLineCode(String lineCode) {
		this.lineCode = lineCode;
	}
	public String getLineName() {
		return lineName;
	}
	public void setLineName(String lineName) {
		this.lineName = lineName;
	}
	public String getUpdate() {
		return update;
	}
	public void setUpdate(String update) {
		this.update = update;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getLineStatus() {
		return lineStatus;
	}
	public void setLineStatus(int lineStatus) {
		this.lineStatus = lineStatus;
	}
	
	
	// �۾����� getter/setter
	public String getInstructionCode() {
		return instructionCode;
	}
	public void setInstructionCode(String instructionCode) {
		this.instructionCode = instructionCode;
	}
	public int getInsVol() {
		return insVol;
	}
	public void setInsVol(int insVol) {
		this.insVol = insVol;
	}
	public String getInstructionDate() {
		return instructionDate;
	}
	public void setInstructionDate(String instructionDate) {
		this.instructionDate = instructionDate;
	}
	public String getContractCode() {
		return contractCode;
	}
	public void setContractCode(String contractCode) {
		this.contractCode = contractCode;
	}
	public String getContractDueDate() {
		return contractDueDate;
	}
	public void setContractDueDate(String contractDueDate) {
		this.contractDueDate = contractDueDate;
	}
	public String getContractDate() {
		return contractDate;
	}
	public void setContractDate(String contractDate) {
		this.contractDate = contractDate;
	}
	public String getPaymentDate() {
		return paymentDate;
	}
	public void setPaymentDate(String paymentDate) {
		this.paymentDate = paymentDate;
	}
	public int getConInfoStatus() {
		return conInfoStatus;
	}
	public void setConInfoStatus(int conInfoStatus) {
		this.conInfoStatus = conInfoStatus;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getProductCode() {
		return productCode;
	}
	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}
	public int getInstractionStatus() {
		return instractionStatus;
	}
	public void setInstractionStatus(int instractionStatus) {
		this.instractionStatus = instractionStatus;
	}
	public int getContractVol() {
		return contractVol;
	}
	public void setContractVol(int contractVol) {
		this.contractVol = contractVol;
	}
	
}
