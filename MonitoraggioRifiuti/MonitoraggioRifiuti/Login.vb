Imports System.Threading

Public Class Login

    'Questa è la dichiarazione del Thread separato da quello principale
    Private newThread As Thread
    'Questa è la dichiarazione del Form SplashScreen
    Private Splash As SplashScreen
    'Questa è una variabile booleana che mi permette di chiudere lo SplashScreen al termine di tutte le operazioni
    Private Fine As Boolean

    'Public Class Form1

    ' Private Sub Form1_Load(sender As System.Object, e As System.EventArgs) Handles MyBase.Load

    'End Sub

    'Login Button
    Private Sub btnlogin_Click(sender As System.Object, e As System.EventArgs) Handles BtnLogin.Click

        'Creo una nuova istanza del Thread
        newThread = New Thread(AddressOf InitializeForm)
        'Faccio partire il Thread separato
        newThread.Start()


        txtUsername.Focus()
        Dim Username As String = txtUsername.Text()

        Dim Password As String = txtPassword.Text()

        If (Password = "1" And Username = "1") Or (Password = "2" And Username = "2") Or (Password = "3" And Username = "3") Then


            frmGestione.Show()
            frmGestione.Visible = False
            RiepilogoGenerale.Show()
            RiepilogoGenerale.Visible = False

            Fine = True
            'MessageBox.Show("Login eseguito: " & Username, "", MessageBoxButtons.OK, MessageBoxIcon.Information)

            Main.Show()

            'Clear all fields
            txtPassword.Text = ""
            txtUsername.Text = ""
        Else
            MessageBox.Show("Login Fallito " & Username, "", MessageBoxButtons.OK, MessageBoxIcon.Information)
            txtPassword.Text = ""
            txtUsername.Text = ""
        End If

        'Me.Close()





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
        'Main.Hide()
        Splash.Close()
        'Main.Hide()
    End Sub




    Private Sub btnClear_Click(sender As System.Object, e As System.EventArgs) Handles btnClear.Click
        'User clicking on cancel button only clears field
        ' and refocus to first field

        txtUsername.Text = ""
        txtPassword.Text = ""
        txtUsername.Focus()
    End Sub

End Class



