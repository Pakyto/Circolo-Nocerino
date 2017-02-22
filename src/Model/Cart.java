package Model;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

public class Cart implements Serializable {

	private static final long serialVersionUID = 1L;

	private Map<Articolo,Integer> items = new HashMap<Articolo,Integer>();

	public Set<Articolo> getItems() {     //restituisce la lista dei prodotti all'interno del carrello
		return items.keySet();
	}

	public int getOrder(Articolo item) {  //restituisce la quantit� del prodotto
		return items.get(item);
	}

	public void put(Articolo item, int order) {  //inserimento di un prodotto
		items.put(item, order);
	}
	
	public void empty() {
		this.items = new HashMap<Articolo,Integer>();
	}

	public void add(Articolo item, int order) {   //order: quantit�

		boolean alreadyInCart = false;     
		
		for ( Articolo itemInCart : getItems() ) {
			if ( itemInCart.getDescrizione().equals( item.getDescrizione() ) ) { //se l'articolo all'interno del carrello � uguale a quello da inserire 
				alreadyInCart = true;
				
				order += getOrder(itemInCart);  //aggiorna la quantit�
				getItems().remove(itemInCart);  //rimuove l'articolo dal carrello
				put(item, order);
				break;
			}
		}
		
		if ( ! alreadyInCart ) {  //se l'articolo non � gi� nel carrello
			put(item,order);
		}
				
	}
	
	public void delete(String descrizione){    
		for(Articolo art: getItems()){                   //getItems restituisce la lista degli articoli
			if(art.getDescrizione().equalsIgnoreCase(descrizione)){ //cancella l'articolo con la descrizione che gli viene passata 
				getItems().remove(art);    
				break;
			}
		}
	}
	
}
