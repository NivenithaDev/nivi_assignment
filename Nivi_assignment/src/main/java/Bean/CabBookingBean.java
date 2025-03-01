package Bean;

public class CabBookingBean {
    private String name;
    private String address;
    private String to;
    private String from;
    private int km;
    private int price; // Add price field

    // Getters and Setters
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }

    public String getTo() { return to; }
    public void setTo(String to) { this.to = to; }

    public String getFrom() { return from; }
    public void setFrom(String from) { this.from = from; }

    public int getKm() { return km; }
    public void setKm(int km) { this.km = km; }

    public int getPrice() { return price; }
    public void setPrice(int price) { this.price = price; } // Add setter for price
}
