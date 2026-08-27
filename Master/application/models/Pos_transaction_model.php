<?php
/*

*/
class Pos_transaction_model extends CI_Model
{
    //USED TO UPDATE QUANTITY IN INOIVCE TRANSACTION
    function general_pos_transaction($new_args, $new_data ,$temp_args ,$temp_data)
    {
        $this->db->trans_start();

        extract($new_args);
        $this->db->where('id', $id);
        $this->db->update($table_name, $new_data);


        extract($temp_args);
        $this->db->where('id', $id);
        $this->db->update($table_name, $temp_data);

        $this->db->trans_complete();

        if ($this->db->trans_status() === FALSE)
        {
            $this->db->trans_rollback();
            $data = NULL;    
        }
        else
        {
            $this->db->trans_commit();
            $data = true; 
        }

        return $data;
    }

    function general_beli_transaction($new_args, $new_data ,$temp_args ,$temp_data)
    {
        $this->db->trans_start();

        /*extract($new_args);
        $this->db->where('id', $id);
        $this->db->update($table_name, $new_data);*/


        extract($temp_args);
        $this->db->where('id', $id);
        $this->db->update($table_name, $temp_data);

        $this->db->trans_complete();

        if ($this->db->trans_status() === FALSE)
        {
            $this->db->trans_rollback();
            $data = NULL;    
        }
        else
        {
            $this->db->trans_commit();
            $data = true; 
        }

        return $data;
    }  

    function update_qty($id, $val){
        $query = $this->db->query("update mp_temp_barcoder_purchase set qty = '".$val."' where id = '".$id."'");
        return true;
        //var_dump("update mp_temp_barcoder_purchase set sales = '".$val."' where id = '".$id."'");
    }

    function update_beli($id, $val){
        $query = $this->db->query("update mp_temp_barcoder_purchase set sales = '".$val."' where id = '".$id."'");
        return true;
        //var_dump("update mp_temp_barcoder_purchase set sales = '".$val."' where id = '".$id."'");
    }

    function update_jual($id, $val){
        $query = $this->db->query("update mp_temp_barcoder_purchase set price = '".$val."' where id = '".$id."'");
        return true;
        //var_dump("update mp_temp_barcoder_purchase set sales = '".$val."' where id = '".$id."'");
    }

    function update_satuan($id, $val){
        $query = $this->db->query("update mp_temp_barcoder_purchase set purchase = '".$val."' where id = '".$id."'");
        return true;
        //var_dump("update mp_temp_barcoder_purchase set sales = '".$val."' where id = '".$id."'");
    }

    function date_ex($id, $val){
        $query = $this->db->query("update mp_temp_barcoder_purchase set date_ex = '".$val."' where id = '".$id."'");
        return true;
        //var_dump("update mp_temp_barcoder_purchase set sales = '".$val."' where id = '".$id."'");
    }

    function update_disc($id, $val){
        //$query = $this->db->query("update mp_temp_barcoder_purchase set disc = '".$val."' where id = '".$id."'");
        $query = $this->db->query("update mp_temp_barcoder_purchase set disc = '".$val."', sales = sales - (sales/100*".$val."), purchase = sales/pack/qty where id = '".$id."'");
        return true;
        //var_dump("update mp_temp_barcoder_purchase set sales = '".$val."' where id = '".$id."'");
    }

    function general_pembelian_transaction($new_args, $new_data ,$temp_args ,$temp_data)
    {
        $this->db->trans_start();

        ///extract($new_args);
       // $this->db->where('id', $id);
       // $this->db->update($table_name, $new_data);


        extract($temp_args);
        $this->db->where('id', $id);
        $this->db->update($table_name, $temp_data);

        $this->db->trans_complete();

        if ($this->db->trans_status() === FALSE)
        {
            $this->db->trans_rollback();
            $data = NULL;    
        }
        else
        {
            $this->db->trans_commit();
            $data = true; 
        }

        return $data;
    }

    //USED TO UPDATE QUANTITY IN RETURN INOIVCE TRANSACTION
    function general_whole_transaction($new_args, $new_data ,$temp_args ,$temp_data)
    {
        $this->db->trans_start();

        extract($new_args);
        $this->db->where('id', $id);
        $this->db->update($table_name, $new_data);


        extract($temp_args);
        $this->db->where('id', $id);
        $this->db->update($table_name, $temp_data);

        $this->db->trans_complete();
        if ($this->db->trans_status() === FALSE)
        {
            $this->db->trans_rollback();
            $data = NULL;    
        }
        else
        {
            $this->db->trans_commit();
            $data = true; 
        }

        return $data;
    }    

}