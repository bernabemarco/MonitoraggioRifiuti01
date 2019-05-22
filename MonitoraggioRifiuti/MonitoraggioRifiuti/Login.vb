Imports System.Threading
'Imports System.Data
Imports System.Data.SqlClient


Public Class Login

    'Questa è la dichiarazione del Thread separato da quello principale
    Private newThread As Thread
    'Questa è la dichiarazione del Form SplashScreen
    Private Splash As SplashScreen
    'Questa è una variabile booleana che mi permette di chiudere lo SplashScreen al termine di tutte le operazioni
    Private Fine As Boolean


    Private Sub btnlogin_Click(sender As System.Object, e As System.EventArgs) Handles BtnLogin.Click



        If txtUsername.Text.Length <= 0 Then
            MessageBox.Show("Please enter Username!")
        ElseIf txtPassword.Text.Length <= 0 Then
            MessageBox.Show("Please enter Password!")
        End If
        Dim str As String = "Data Source=localhost;Initial Catalog=Sicura;User ID='" & txtUsername.Text & "';Password='" & txtPassword.Text & "'"



        Dim sql As String = "Select userid from tabutenti where userid='" & txtUsername.Text & "'"

        Try

            Using Conn As New SqlConnection(str)
                Using cmd As New SqlCommand(sql, Conn)
                    Conn.Open()

                    Dim value As SqlDataReader = cmd.ExecuteReader()
                    If value.HasRows Then
                        MessageBox.Show("Login eseguito!")

                        'Creo una nuova istanza del Thread
                        newThread = New Thread(AddressOf InitializeForm)
                        'Faccio partire il Thread separato
                        newThread.Start()

                        txtUsername.Focus()
                        UtenteCorrente = txtUsername.Text()


                        frmGestione.Codici_CERTableAdapter.FillCodiciCer(frmGestione.SicuraDataSet.Codici_CER)
                        frmGestione.EXTRATESTERIFIUTITableAdapter.FillExtraTesteRifiuti(frmGestione.SicuraDataSet.EXTRATESTERIFIUTI)
                        frmGestione.Biri_MonitoraggioRifiutiTableAdapter.FillMonitoraggio(frmGestione.SicuraDataSet.Biri_MonitoraggioRifiuti)
                        RiepilogoGenerale.RiepilogoGeneraleDTTableAdapter.FillRiepGenerale(RiepilogoGenerale.SicuraDataSet.RiepilogoGeneraleDT)

                        Main.Show()
                        Fine = True
                    Else

                        txtUsername.Text = ""
                        txtPassword.Text = ""
                        txtUsername.Focus()
                        MessageBox.Show("Login Fallito! o utente non trovato")

                    End If


                End Using

            End Using

        Catch ex As Exception

            txtUsername.Text = ""
            txtPassword.Text = ""
            txtUsername.Focus()
            MessageBox.Show("Login Fallito!")

        End Try


    End Sub

    Private Sub InitializeForm()
        ' Qui ho giocato un pò con delle variabili integer per permettere una stupidissima animazione della Label
        'senza bloccare l'esecuzione del Thread in modo da lasciare scorrere l'animazione della progress bar.
        Dim a As Integer
        Dim b As Integer
        Splash = New SplashScreen
        Splash.Show()
        Splash.Label1.Text = "Caricamento in corso"
        Do
            If a > 10000 Then
                Splash.Label1.Text += "."
                a = 0
                b += 1
            End If
            a += 1
            If b > 10 Then
                Splash.Label1.Text = "Caricamento in corso"
                b = 0
            End If
            'Questo permette l'aggiornamento della parte grafica dello splashscreen
            Application.DoEvents()
        Loop Until Fine

        Splash.Close()

    End Sub




    Private Sub btnClear_Click(sender As System.Object, e As System.EventArgs) Handles btnClear.Click
        'User clicking on cancel button only clears field
        ' and refocus to first field

        txtUsername.Text = ""
        txtPassword.Text = ""
        txtUsername.Focus()
    End Sub

    Private Sub txtUsername_Click(sender As Object, e As EventArgs) Handles txtUsername.Click
        HelpBoxlbl.Text = "Inserisci qui il nome utente"
    End Sub

    Private Sub txtPassword_Click(sender As Object, e As EventArgs) Handles txtPassword.Click
        HelpBoxlbl.Text = "Inserisci qui la passsword"
    End Sub
End Class



