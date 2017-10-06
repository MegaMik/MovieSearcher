using System;
using System.Web.UI.WebControls;

namespace MovieSearch
{
    public partial class Index : System.Web.UI.Page
    {
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string strSearchKW = txtMovies.Text.Trim();
            if (strSearchKW != "")
            {
                
                lstSaveLog.Visible = true;
                lblTimeLog.Visible = true;
                lstSaveLog.Items.Insert(0, "Date:" + DateTime.Now.ToShortDateString() + "    " + "Time:" + DateTime.Now.ToLongTimeString() + "  -  " + txtMovies.Text);
                LoadMovies(clsGlobalVars.PageNum);

            }

        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string script = "$(document).ready(function () { $('[id*=btnSubmit]').click(); });";
                ClientScript.RegisterStartupScript(this.GetType(), "load", script, true);
                txtMovies.Focus();
                clsGlobalVars.PageNum = 1;
                clsGlobalVars.StrSearchTitle = "";
            }
        }
        private void LoadMovies(int pageNum)
        {

            try
            {
            //clsGlobalVars.PageNum = pageNum;
            clsGlobalVars.StrSearchTitle = txtMovies.Text;
            clsGlobalVars.StrSearchTitlePage = txtMovies.Text;

            clsGlobalVars.Total_results = 0;
            lstMovies.Items.Clear();

            var client = new RestSharp.RestClient("https://api.themoviedb.org/3/search/movie?page=" + clsGlobalVars.PageNum + "&query=" + clsGlobalVars.StrSearchTitle + "&api_key=b337033f81f4225995f23774f6729c8c");
            var request = new RestSharp.RestRequest(RestSharp.Method.GET);
            request.AddParameter("undefined", "{}", RestSharp.ParameterType.RequestBody);
            request.RequestFormat = RestSharp.DataFormat.Json;
            var response = client.Execute(request);
            dynamic MovieList = Newtonsoft.Json.JsonConvert.DeserializeObject(response.Content);
            int page = MovieList.total_pages;
            clsGlobalVars.Total_results = MovieList.total_results;
            lblFoundNumMovies.Text = "Found " + clsGlobalVars.Total_results + " movies";
            lblFoundNumMovies.Visible = true;

            rbPages.RepeatColumns = 12;
            rbPages.RepeatLayout = RepeatLayout.Table;
            

            rbPages.Items.Clear();
            for (int nLoop = 1; nLoop < page + 1; nLoop++)
            {
                rbPages.Items.Add(new ListItem(nLoop.ToString(), nLoop.ToString()));
            }

            rbPages.SelectedIndex = clsGlobalVars.PageNum - 1;
            rbPages.Visible = true;

            var results = MovieList.results;
            lstMovies.AutoPostBack = true;
                rbPages.TextAlign = TextAlign.Left;
                
            foreach (var detail in results)
                {
                    lstMovies.Items.Add("Movie Id: " + detail.id.Value + ": Movie title: " + detail.title.Value);
                }
            }

            catch (Exception ex)
            {
                lblFoundNumMovies.Text = "Error trying to find movies with titles" + ex.Message; 
            }
        }

        protected void lstMovies_SelectedIndexChanged(object sender, EventArgs e)
        {
           //Code to find information about specific movie title
        }

        protected void rbPages_SelectedIndexChanged(object sender, EventArgs e)
        {

            clsGlobalVars.PageNum = rbPages.SelectedIndex + 1;
            txtMovies.Text = clsGlobalVars.StrSearchTitlePage;

            lstSaveLog.Visible = true;
            lblTimeLog.Visible = true;
            //lstSaveLog.Items.Insert(0, "Date:" + DateTime.Now.ToShortDateString() + "    " + "Time:" + DateTime.Now.ToLongTimeString() + "  -  " + txtMovies.Text);
            LoadMovies(clsGlobalVars.PageNum);
        }
    }
}