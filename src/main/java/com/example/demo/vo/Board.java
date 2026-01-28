package com.example.demo.vo;

public class Board {
    private int id;
    private String name;
    private String code;
    private int order;

    public Board() {}

    public Board(int id, String name, String code, int order) {
        this.id = id;
        this.name = name;
        this.code = code;
        this.order = order;
    }

    // --- Getter / Setter ---
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getCode() { return code; }
    public void setCode(String code) { this.code = code; }

    public int getOrder() { return order; }
    public void setOrder(int order) { this.order = order; }
}