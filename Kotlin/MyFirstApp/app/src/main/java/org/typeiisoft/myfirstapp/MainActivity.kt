package org.typeiisoft.myfirstapp

import android.content.Intent
import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import android.view.View
//import android.widget.TextView
import android.widget.Toast

import kotlinx.android.synthetic.main.activity_main.textView

class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
    }

    fun toastMe(view: View) {
        val myToast = Toast.makeText(this, "Hello Toast!", Toast.LENGTH_SHORT)
        myToast.show()
    }

    fun countMe(view: View) {
        // Get the text view
        //val showCountTextView = findViewById<TextView>(R.id.textView)

        // Get the value of the text view
        //val countString = showCountTextView.text.toString()
        val countString = textView.text.toString()

        // Convert the value to a number and increment
        var count: Int = Integer.parseInt(countString)
        count++

        // Display the new value in the text view
        textView.text = count.toString()
    }

    fun randomMe(view: View) {
        // Create an Intent to start the second activity
        val randomIntent = Intent(this, SecondActivity::class.java)

        // Get the value of the text view
        val countString = textView.text.toString()

        // Convert the value to a number
        var count: Int = Integer.parseInt(countString)

        // Add the count to the extra for the intent
        randomIntent.putExtra(SecondActivity.TOTAL_COUNT, count)

        // Start the new activity
        startActivity(randomIntent)
    }
}
