Imports System.Data
Imports System.Data.SqlClient

Public Class Login


    'Public Class Form1

    ' Private Sub Form1_Load(sender As System.Object, e As System.EventArgs) Handles MyBase.Load

    'End Sub

    'Login Button
    Private Sub btnlogin_Click(sender As System.Object, e As System.EventArgs) Handles BtnLogin.Click


        'Do something here


        Dim Username As String = txtUsername.Text()

        Dim Password As String = txtPassword.Text()

        If Password = "Bo" And Username = "Biri" Then

            MessageBox.Show("Logged in successfully as " & Username, "", MessageBoxButtons.OK, MessageBoxIcon.Information
                                                )
            Main.Show()
            Me.Hide()

            'Clear all fields
            txtPassword.Text = ""
            txtUsername.Text = ""

        End If


    End Sub


    Private Sub btnClear_Click(sender As System.Object, e As System.EventArgs) Handles btnClear.Click
        'User clicking on cancel button only clears field
        ' and refocus to first field

        txtUsername.Text = ""
        txtPassword.Text = ""
        txtUsername.Focus()
    End Sub

End Class



