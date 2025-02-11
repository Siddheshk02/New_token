/*
/// Module: new_token
module new_token::new_token;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions

#[allow(duplicate_alias)]
module examples ::New_token{
    use sui::coin::{Self, TreasuryCap};
    use sui::tx_context::{Self, TxContext};
   
    public struct NEW_TOKEN has drop {}
    
    fun init(witness: NEW_TOKEN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(witness, 6, b"HackQuest", b"WEB3", b"New_token", option::none(), ctx );        
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury, tx_context::sender(ctx));
    }      
    
    public fun mint(treasury_cap: &mut TreasuryCap<NEW_TOKEN>, amount: u64, recipient: address, ctx: &mut TxContext) {
           let coin = coin::mint(treasury_cap, amount, ctx);
           transfer::public_transfer(coin, recipient);
    }
}
